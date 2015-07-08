//
//  TYVModelArray.m
//  IDAPCourseUI
//
//  Created by YURII on 07.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVModelArray.h"
#import "TYVDataArrayModelInfo.h"
#import "TYVModelMovingPosition.h"

#import "NSIndexPath+TYVExtensions.h"
#import "NSMutableArray+TYVExtensions.h"

static NSString *const  kTYVFileName = @"info.plist";

static NSString * const  kTYVMutableArrayFiled = @"mutableDataArray";

@interface TYVModelArray ()
@property (nonatomic, strong)   NSMutableArray *mutableDataArray;

@property (nonatomic, assign)   BOOL    shouldNotify;

@end

@implementation TYVModelArray
@synthesize state = _state;

@dynamic dataArray;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)dataWithModelsCount:(NSUInteger)count {
    return [[self alloc] initWithModelsCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        self.mutableDataArray = [NSMutableArray arrayWithCapacity:count];
        self.shouldNotify = YES;
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithModelsCount:0];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)dataArray {
    @synchronized (self) {
        return [self.mutableDataArray copy];
    }
}

- (void)setState:(NSUInteger)state  {
    @synchronized(self) {
        _state = state;
        
        if ([self shouldNotify]) {
            [self notify];
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addModelsFromArray:(NSArray *)otherArray {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array addObjectsFromArray:otherArray];
        
        [self setState:TYVModelDidChange];
    }
    
}

- (void)addModel:(id)model {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array addObject:model];
        
        NSIndexPath *path = [NSIndexPath pathWithIndex:[array count] - 1];
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo infoWithChangeState:TYVDataArrayModelInsert
                                                                        changing:path];
        
        [self setState:TYVModelDidChange withObject:info];
    };
}

- (void)removeModel:(id)model {
    [self.mutableDataArray removeObject:model];
}

- (void)insertModelAtIndex:(id)model index:(NSUInteger)index {
    [self.mutableDataArray insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array removeObjectAtIndex:index];
        
        NSIndexPath *path = [NSIndexPath pathWithIndex:index];
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo infoWithChangeState:TYVDataArrayModelDelete
                                                                        changing:path];
        
        [self setState:TYVModelDidChange withObject:info];
    };
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
        
        TYVModelMovingPosition *position = [TYVModelMovingPosition movingAtIndex:sourceIndex
                                                                destinationIndex:destinationIndex];
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo infoWithChangeState:TYVDataArrayModelMove
                                                                        changing:position];
        
        [self setState:TYVModelDidChange withObject:info];
    }
}

- (id)modelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        return [self.mutableDataArray objectAtIndex:index];
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    @synchronized (self) {
        return [self.mutableDataArray objectAtIndexedSubscript:index];
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return [self.mutableDataArray count];
    }
}

- (void)exchangeModelAtIndex:(NSUInteger)sourceIndex withModelAtIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        [self.mutableDataArray exchangeObjectAtIndex:sourceIndex withObjectAtIndex:destinationIndex];
    }
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.mutableDataArray forKey:kTYVMutableArrayFiled];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.mutableDataArray = [decoder decodeObjectForKey:kTYVMutableArrayFiled];
    }
    
    return self;
}

@end
