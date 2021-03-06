//
//  TYVImageCache.m
//  IDAPCourseUI
//
//  Created by YURII on 13.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVImageCache.h"

@interface TYVImageCache ()
@property (nonatomic, strong)   NSMapTable  *cache;

@end

@implementation TYVImageCache

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedImageCache {
    static TYVImageCache *__sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedObject = [[self alloc] init];
    });
    
    return __sharedObject;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cache = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsCopyIn
                                           valueOptions:NSPointerFunctionsWeakMemory];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object forKey:(id)key {
    @synchronized (self) {
        [self.cache setObject:object forKey:key];
    }
}

- (void)removeObjectForKey:(id)key {
    @synchronized (self) {
        [self.cache removeObjectForKey:key];
    }
}

- (id)objectForKey:(id)key {
    @synchronized (self) {
        return [self.cache objectForKey:key];
    }
}

- (BOOL)containsObjectForKey:(id)key {
    return nil != [self objectForKey:key];
}

- (NSUInteger)count {
    @synchronized (self) {
        return [self.cache count];
    }
}

@end
