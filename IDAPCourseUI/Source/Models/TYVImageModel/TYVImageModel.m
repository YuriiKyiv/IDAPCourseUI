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
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
        self.cache = [TYVImageCache sharedImageCache];
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
            
            id object = nil;
            
            TYVBlock block = (object == [self.cache objectForKey:self.url]) ? [self loadFromCacheBlock]
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
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]
                                                          delegate:self
                                                     delegateQueue:nil];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:self.url];
    
    return nil;
}

#pragma mark -
#pragma mark NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
    @synchronized (self) {
        self.state = TYVModelFailedLoading;
    }
}

#pragma mark -
#pragma mark NSURLSessionDownloadDelegate

- (void)        URLSession:(NSURLSession *)session
              downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didFinishDownloadingToURL:(NSURL *)location
{
    //save a file
}

@end
