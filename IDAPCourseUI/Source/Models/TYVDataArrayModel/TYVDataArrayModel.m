//
//  TYVDataArrayModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModel.h"

#import "NSMutableArray+TYVExtensions.h"

@interface TYVDataArrayModel ()
@property (nonatomic, strong)   NSMutableArray *mutableDataArray;

@end

@implementation TYVDataArrayModel

@dynamic dataArray;

#pragma mark -
#pragma mark Initializations and Deallocations

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
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:[array count]];
    [self setState:TYVDataArrayDidChange withObject:set];
}

- (void)removeModel:(TYVDataModel *)model {
    [self.mutableDataArray removeObject:model];
}

- (void)insertModelAtIndex:(TYVDataModel *)model index:(NSUInteger)index {
    [self.mutableDataArray insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index{
    [self.mutableDataArray removeObjectAtIndex:index];
//    [self setState:TYVDataArrayDidChange withObject:@"remove"];
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    [self.mutableDataArray moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
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
        case TYVDataArrayDidChange:
            return @selector(dataArrayDidChange:withObject:);
        default:
            return [super selectorForState:state];
    }
}

@end
