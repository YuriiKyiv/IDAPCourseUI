//
//  TYVDataArrayModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModel.h"
#import "TYVDataModel.h"
#import "TYVDataArrayModelInfo.h"
#import "TYVModelMovingPosition.h"
#import "TYVDataArrayModelProtocol.h"

#import "NSMutableArray+TYVExtensions.h"
#import "NSIndexPath+TYVExtensions.h"

static NSString *const  kTYVFilePath = @"/tmp/myArchive";

static NSString * const  kTYVMutableArrayFiled = @"mutableDataArray";

@interface TYVDataArrayModel ()
@property (nonatomic, strong)   NSMutableArray *mutableDataArray;

@end

@implementation TYVDataArrayModel

@dynamic dataArray;

+ (instancetype)dataWithModelsCount:(NSUInteger)count {
    return [[self alloc] initWithModelsCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
        for (int i = 0; i < count; i++) {
            [array addObject:[TYVDataModel model]];
        }
        
        self.mutableDataArray = array;
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableDataArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)dataArray {
    @synchronized (self) {
        return [self.mutableDataArray copy];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addModel:(TYVDataModel *)model {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array addObject:model];
        
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo new];
        [info.insertIndexes addObject:[NSIndexPath pathWithIndex:[array count] - 1]];
        
        [self setState:TYVAbstractDataModelDidChange withObject:info];
    };
}

- (void)removeModel:(TYVDataModel *)model {
    [self.mutableDataArray removeObject:model];
}

- (void)insertModelAtIndex:(TYVDataModel *)model index:(NSUInteger)index {
    [self.mutableDataArray insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array removeObjectAtIndex:index];
        
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo new];
        [info.deleteIndexes addObject:[NSIndexPath pathWithIndex:index]];
        
        [self setState:TYVAbstractDataModelDidChange withObject:info];
    };
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
        
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo new];
        info.movePosition = [TYVModelMovingPosition movingAtIndex:sourceIndex
                                                 destinationIndex:destinationIndex];
        
        [self setState:TYVAbstractDataModelDidChange withObject:info];
    }
}

- (TYVDataModel *)modelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        return [self.mutableDataArray objectAtIndex:index];
    }
}

- (TYVDataModel *)objectAtIndexedSubscript:(NSUInteger)index {
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

- (void)save {
    @synchronized (self) {
        [NSKeyedArchiver archiveRootObject:self toFile:kTYVFilePath];
    }
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    TYVDataArrayModel *modelsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:kTYVFilePath];
    if (modelsArray) {
        self.mutableDataArray = modelsArray.mutableDataArray;
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
