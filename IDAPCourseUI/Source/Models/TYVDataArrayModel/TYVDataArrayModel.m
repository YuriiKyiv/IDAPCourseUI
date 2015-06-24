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
#import "NSMutableArray+TYVExtensions.h"

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
    return [self.mutableDataArray copy];
}

#pragma mark -
#pragma mark Public Methods

- (void)addModel:(TYVDataModel *)model {
    NSMutableArray *array = self.mutableDataArray;
    [array addObject:model];
    
    TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo new];
    info.insertIndexes[0] = [NSIndexPath indexPathForItem:[array count] - 1 inSection:0];
    [self setState:TYVDataArrayDidChangeCount withObject:info];
}

- (void)removeModel:(TYVDataModel *)model {
    [self.mutableDataArray removeObject:model];
}

- (void)insertModelAtIndex:(TYVDataModel *)model index:(NSUInteger)index {
    [self.mutableDataArray insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index{
    NSMutableArray *array = self.mutableDataArray;
    [array removeObjectAtIndex:index];

    TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo new];
    info.deleteIndexes[0] = [NSIndexPath indexPathForItem:index inSection:0];
    [self setState:TYVDataArrayDidChangeCount withObject:info];
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    NSMutableArray *array = self.mutableDataArray;
    [array moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
    
    TYVDataArrayModelInfo *info = [TYVDataArrayModelInfo new];
    info.moveIndexes[0] = [NSIndexPath indexPathForItem:sourceIndex inSection:0];
    info.moveIndexes[1] = [NSIndexPath indexPathForItem:destinationIndex inSection:0];
    [self setState:TYVDataArrayDidChangeOrder withObject:info];
}

- (TYVDataModel *)modelAtIndex:(NSUInteger)index {
    return [self.mutableDataArray objectAtIndex:index];
}

- (TYVDataModel *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.mutableDataArray objectAtIndexedSubscript:index];
}

- (NSUInteger)count {
    return [self.mutableDataArray count];
}

- (void)exchangeModelAtIndex:(NSUInteger)sourceIndex withModelAtIndex:(NSUInteger)destinationIndex {
    [self.mutableDataArray exchangeObjectAtIndex:sourceIndex withObjectAtIndex:destinationIndex];
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TYVDataArrayDidChangeCount:
            return @selector(dataArrayDidChangeCount:withObject:);
            
        case TYVDataArrayDidChangeOrder:
            return @selector(dataArrayDidChangeOrder:withObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
