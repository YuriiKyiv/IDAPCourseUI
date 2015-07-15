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

static NSString * const  kTYVSessionName   = @"backgroung";

@interface TYVImageModel ()
@property (nonatomic, strong)   NSURL           *url;
@property (nonatomic, strong)   UIImage         *image;
@property (nonatomic, strong)   TYVImageCache   *cache;
@property (nonatomic, readonly) NSString        *path;
@property (nonatomic, retain)   NSURLSession    *session;

- (void)dump;

- (TYVBlock)loadFromCacheBlock;

- (TYVBlock)loadFromUrlBlock;

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
    return nil;
}

#pragma mark -
#pragma mark Public Methods

- (void)load {
    @synchronized (self) {
        if (TYVModelUnloaded == self.state
            || TYVModelFailedLoading == self.state)
        {
            self.state = TYVModelWillLoad;
            
            TYVBlock block = ([self.cache containsObjectForKey:self.url]) ? [self loadFromCacheBlock]
                                                                            : [self loadFromUrlBlock];
            TYVDispatchAsyncOnDefaultQueueWithBlock(block);

        }
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)dump {
    @synchronized (self) {
        self.state = TYVModelUnloaded;
    }
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
                                                         completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
        {
            self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
            self.state = TYVModelLoaded;
        }];
        
        [task resume];
    };
    
    return block;
}

#pragma mark -
#pragma mark NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
    @synchronized (self) {
        self.state = TYVModelFailedLoading;
    }
}

@end
