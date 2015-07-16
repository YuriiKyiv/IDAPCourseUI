//
//  TYVImageModel.m
//  IDAPCourseUI
//
//  Created by YURII on 13.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TYVImageModel.h"
#import "TYVImageCache.h"
#import "TYVDispatch.h"
#import "TYVMacro.h"
#import "NSFileManager+TYVExtensions.h"

typedef void(^TYVCompletionBlock)(NSURL *, NSURLResponse *, NSError *);

//static NSURLSession * TYVURLSession = nil;

TYVImageCache *TYVCache();

TYVImageCache *TYVCache() {
    return [TYVImageCache sharedImageCache];
}

@interface TYVImageModel ()
@property (nonatomic, strong)   NSURL           *url;
@property (nonatomic, strong)   UIImage         *image;

@property (nonatomic, readonly) NSString        *path;

@property (nonatomic, strong)   NSURLSession    *session;

@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;

- (TYVBlock)loadFromCacheBlock;

- (TYVBlock)loadFromUrlBlock;

- (TYVCompletionBlock)completionBlock;

- (void)performWorkWithLocation:(NSURL *)location;

@end

@implementation TYVImageModel

@dynamic path;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancelLoading];
    [TYVCache() removeObjectForKey:self.url];
}

- (instancetype)initWithURL:(NSURL *)url {
    TYVImageCache *cache = TYVCache();
    if (![cache containsObjectForKey:url]) {
        self = [super init];
        if (self) {
            self.url = url;
            NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
            self.session = [NSURLSession sessionWithConfiguration:config];
            [cache addObject:self forKey:url];
        }
    } else {
        self = [cache objectForKey:url];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [[NSFileManager documentsDirectory] stringByAppendingString:self.url.path];
}

#pragma mark -
#pragma mark Public Methods

- (void)cancelLoading {
    @synchronized (self) {
        if (self.state == TYVModelWillLoad) {
            [self.task cancel];
        } else {
            self.image = nil;
        }
        
        self.state = TYVModelUnloaded;
    }
}

#pragma mark -
#pragma mark Private Methods

//- (NSURLSession *)session {
//    @synchronized (self) {
//        if (!TYVURLSession) {
//            NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//            TYVURLSession = [NSURLSession sessionWithConfiguration:config];
//        }
//    }
//    
//    return TYVURLSession;
//}

- (void)performWorkWithLocation:(NSURL *)location {
    NSString *path = self.path;
    
    [NSFileManager createDirectoryAtFilePath:path];
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    [data writeToFile:path atomically:YES];
    
    TYVImageCache *cache = [TYVImageCache sharedImageCache];
    [cache addObject:self forKey:self.url];
    
    self.image = [UIImage imageWithData:data];
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    TYVBlock block = ([TYVCache() containsObjectForKey:self.url]) ? [self loadFromCacheBlock]
                                                                    : [self loadFromUrlBlock];
    TYVDispatchAsyncOnDefaultQueueWithBlock(block);
}

#pragma mark -
#pragma mark TYVImageBlock

- (TYVBlock)loadFromCacheBlock {
    TYVWeakify(self);
    TYVBlock block = ^{
        TYVStrongifyAndReturnIfNil(self);
        
        UIImage *image = self.image;
        
        if (!image) {
            image = [UIImage imageWithContentsOfFile:self.path];
            
            if (!image) {
                TYVDispatchAsyncOnDefaultQueueWithBlock([self loadFromUrlBlock]);
            }
        }
        
        self.image = image;
        
        self.state = TYVModelLoaded;
    };
    
    return block;
}

- (TYVBlock)loadFromUrlBlock {
    TYVWeakify(self);
    TYVBlock block = ^{
        TYVStrongifyAndReturnIfNil(self);
        NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:self.url
                                                         completionHandler:[self completionBlock]];
        [task resume];
        
        self.task = task;
    };
    
    return block;
}

- (TYVCompletionBlock)completionBlock {
    TYVCompletionBlock block = ^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (error) {
            self.state = TYVModelFailedLoading;
        } else {
            [self performWorkWithLocation:location];
            
            self.state = TYVModelLoaded;
        }
    };
    
    return block;
}

@end
