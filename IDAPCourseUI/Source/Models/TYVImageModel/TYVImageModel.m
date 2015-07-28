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

typedef void(^TYVCompletionBlock)(id, id, id);

@interface TYVImageModel ()
@property (nonatomic, strong)   NSURL           *url;
@property (nonatomic, strong)   UIImage         *image;
@property (nonatomic, readonly) NSString        *path;

@property (nonatomic, readonly) TYVImageCache   *cache;
@property (nonatomic, readonly) NSURLSession    *session;

@property (nonatomic, readonly, getter=isCached)    BOOL    cached;


@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;

+ (NSURLSession *)session;

+ (TYVImageCache *)cache;

- (TYVBlock)loadFromUrlBlock;

- (TYVCompletionBlock)completionBlock;

- (void)loadImageWithLocation:(NSURL *)location;

- (void)copyFileAtPath:(NSURL *)location
                toPath:(NSString *)path
                 error:(NSError **)error;

@end

@implementation TYVImageModel

@dynamic path;
@dynamic cache;
@dynamic session;
@dynamic cached;

#pragma mark -
#pragma mark Class Methods

+ (NSURLSession *)session {
    static NSURLSession *__sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        __sharedObject = [NSURLSession sessionWithConfiguration:config];
    });
    
    return __sharedObject;
}

+ (TYVImageCache *)cache {
    return [TYVImageCache sharedImageCache];
}

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.task = nil;
    [self.cache removeObjectForKey:self.url];
}

- (instancetype)initWithURL:(NSURL *)url {
    @synchronized (self.cache) {
        TYVImageCache *cache = self.cache;
        id object = [cache objectForKey:url];
        
        if (object) {
            return object;
        }
        
        self = [super init];
        
        if (self) {
            self.url = url;
            [cache addObject:self forKey:url];
        }
        
        return self;
    }
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isCached {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:self.path];
}

- (NSString *)path {
    NSString *path = self.url.path;
    if (path) {
        return [[NSFileManager documentsDirectory] stringByAppendingString:path];
    }
    
    return nil;
}

- (TYVImageCache *)cache {
    return [[self class] cache];
}

- (NSURLSession *)session {
    return [[self class] session];
}

- (void)setTask:(NSURLSessionDownloadTask *)task {
    if (task != _task) {
        [_task cancel];
        
        _task = task;
        [_task resume];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)loadImageWithLocation:(NSURL *)location {
    UIImage *image = [UIImage imageWithContentsOfFile:location.path];
    if (image) {
        [self copyFileAtPath:location toPath:self.path error:nil];
        self.image = image;
    } else  {
        self.state = TYVModelFailedLoading;
    }
}

- (void)copyFileAtPath:(NSURL *)location toPath:(NSString *)path error:(NSError **)error {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [NSFileManager createDirectoryAtFilePath:path];
    [fileManager copyItemAtPath:location.absoluteString toPath:path error:nil];
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = self.path;
    UIImage *image = nil;
    
    if ([self isCached]
        && (image = [UIImage imageWithContentsOfFile:path]))
    {
        self.image = image;
        self.state = TYVModelLoaded;
    } else {
        [fileManager removeItemAtPath:path error:nil];
        TYVDispatchAsyncOnDefaultQueueWithBlock([self loadFromUrlBlock]);
    }
    
}

#pragma mark -
#pragma mark TYVImageBlock

- (TYVBlock)loadFromUrlBlock {
    TYVWeakify(self);
    TYVBlock block = ^{
        TYVStrongifyAndReturnIfNil(self);
        self.task  = [self.session downloadTaskWithURL:self.url
                                     completionHandler:[self completionBlock]];
    };
    
    return block;
}

- (TYVCompletionBlock)completionBlock {
    TYVWeakify(self);
    TYVCompletionBlock block = ^(NSURL *location, NSHTTPURLResponse *response, NSError *error) {
        TYVStrongifyAndReturnIfNil(self);
        if (error || response.statusCode != 200) {
            self.state = TYVModelFailedLoading;
        } else {
            [self loadImageWithLocation:location];
            
            self.state = TYVModelLoaded;
        }
    };
    
    return block;
}

@end
