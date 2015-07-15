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

- (void)dump;

- (TYVBlock)loadFromCacheBlock;

- (TYVBlock)loadFromUrlBlock;

- (TYVCompletionBlock)completionBlock;

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

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
        self.cache = [TYVImageCache sharedImageCache];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config];
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
            self.state = TYVModelUnloaded;
        }
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)dump {
    self.state = TYVModelUnloaded;
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    TYVBlock block = ([self.cache containsObjectForKey:self.url]) ? [self loadFromCacheBlock]
                                                                    : [self loadFromUrlBlock];
    TYVDispatchAsyncOnDefaultQueueWithBlock(block);
}

#pragma mark -
#pragma mark TYVImageBlock

- (TYVBlock)loadFromCacheBlock {
    TYVWeakify(self);
    TYVBlock block = ^{
        TYVStrongifyAndReturnIfNil(self);
        self.image = [UIImage imageWithContentsOfFile:self.path];
        
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
            [[NSFileManager defaultManager] createDirectoryAtPath:[self.path stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
            NSData *data = [NSData dataWithContentsOfURL:location];
            BOOL result = [data writeToFile:self.path atomically:YES];
            NSLog(@"%@, %d",self.path, result);
            self.image = [UIImage imageWithData:data];
            self.state = TYVModelLoaded;
            
        }
    };
    
    return block;
}

@end
