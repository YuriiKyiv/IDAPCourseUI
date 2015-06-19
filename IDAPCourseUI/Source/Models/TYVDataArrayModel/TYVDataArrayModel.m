//
//  TYVDataArrayModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModel.h"

@interface TYVDataArrayModel ()
@property (nonatomic, strong)   NSMutableArray *mutableDataArray;

@end

@implementation TYVDataArrayModel

#pragma mark -
#pragma mark Public Methods

- (void)addModel:(TYVDataModel *)model {
    [self.mutableDataArray addObject:model];
}

- (void)removeModel:(TYVDataModel *)model {
    [self.mutableDataArray removeObject:model];
}

- (void)addModelAtIndex:(TYVDataModel *)model index:(NSUInteger)index {

}

- (void)removeModelAtIndex:(NSUInteger)index{
    [self.mutableDataArray removeObjectAtIndex:index];
}

- (TYVDataModel *)modelAtIndex:(NSUInteger)index {
    return [self.mutableDataArray objectAtIndex:index];
}

- (TYVDataModel *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndexedSubscript:index];
}

- (NSUInteger)count {
    return [self.mutableDataArray count];
}

@end
