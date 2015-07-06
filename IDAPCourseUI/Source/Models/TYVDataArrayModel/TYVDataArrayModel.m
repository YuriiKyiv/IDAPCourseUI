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
#import "NSFileManager+TYVExtensions.h"
#import "NSString+TYVExtensions.h"

static NSUInteger const  TYVArrayCount = 10;

static NSString *const  kTYVFileName = @"Table";

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
        self.mutableDataArray = [NSMutableArray arrayWithCapacity:count];
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

#pragma mark -
#pragma mark Public Methods

- (void)addModel:(TYVDataModel *)model {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array addObject:model];
        
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo infoWithChangeState:TYVDataArrayModelInsert
                                                                        changing:@([array count] - 1)];
        
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
        
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo infoWithChangeState:TYVDataArrayModelDelete
                                                                        changing:[NSIndexPath pathWithIndex:index]];
        
        [self setState:TYVAbstractDataModelDidChange withObject:info];
    };
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        NSMutableArray *array = self.mutableDataArray;
        [array moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
        
        TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo infoWithChangeState:TYVDataArrayModelMove
                                                                        changing:[TYVModelMovingPosition
                                                                                  movingAtIndex:sourceIndex
                                                                                  destinationIndex:destinationIndex]];
        
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
        NSString *path = [[NSString directoryForUserDocument] stringByAppendingString:kTYVFileName];
        [NSKeyedArchiver archiveRootObject:self toFile:path];
    }
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    NSString *path = [[NSString directoryForUserDocument] stringByAppendingString:kTYVFileName];
    TYVDataArrayModel *modelsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *array = self.mutableDataArray;
    if (modelsArray) {
        array = modelsArray.mutableDataArray;
    } else {
        for (int i = 0; i < TYVArrayCount; i++) {
            [array addObject:[TYVDataModel model]];
        }
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
