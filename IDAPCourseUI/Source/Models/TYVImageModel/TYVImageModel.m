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

@interface TYVImageModel ()
@property (nonatomic, strong)   NSURL           *url;
@property (nonatomic, strong)   UIImage         *image;
@property (nonatomic, strong)   TYVImageCache   *cache;

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
    TYVImageCache *cache = [TYVImageCache sharedImageCache];
    [cache removeObjectForKey:self.url];
}

- (instancetype)initWithURL:(NSURL *)url {
    TYVImageCache *cache = [TYVImageCache sharedImageCache];
    
    if (![cache containsObjectForKey:url]) {
        self = [super init];
        if (self) {
            self.url = url;
            self.cache = [TYVImageCache sharedImageCache];
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

- (void)performWorkWithLocation:(NSURL *)location {
    NSString *path = self.path;
    
    [NSFileManager createDirectoryAtFilePath:path];
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    [data writeToFile:path atomically:YES];
    
    [self.cache addObject:self forKey:self.url];
    NSLog(@"%lu", (unsigned long)[self.cache count]);
    
    self.image = [UIImage imageWithData:data];
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    id object = [self.cache objectForKey:self.url];
    TYVBlock block = (object) ? [self loadFromCacheBlock] : [self loadFromUrlBlock];
    TYVDispatchAsyncOnDefaultQueueWithBlock(block);
}

#pragma mark -
#pragma mark TYVImageBlock

- (TYVBlock)loadFromCacheBlock {
    TYVWeakify(self);
    TYVBlock block = ^{
        TYVStrongifyAndReturnIfNil(self);
        UIImage *image = [UIImage imageWithContentsOfFile:self.path];
        
        if (image) {
            TYVDispatchAsyncOnDefaultQueueWithBlock([self loadFromUrlBlock]);
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
