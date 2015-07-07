//
//  TYVModelArray.h
//  IDAPCourseUI
//
//  Created by YURII on 07.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractDataModel.h"

@interface TYVModelArray : TYVAbstractDataModel <NSCoding>
@property (nonatomic, readonly) NSArray *dataArray;

+ (instancetype)dataWithModelsCount:(NSUInteger)count;

- (instancetype)initWithModelsCount:(NSUInteger)count;

- (void)addModel:(id)model;
- (void)removeModel:(id)model;

- (void)insertModelAtIndex:(id)model
                     index:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)exchangeModelAtIndex:(NSUInteger)sourceIndex
            withModelAtIndex:(NSUInteger)destinationIndex;

- (void)moveModelAtIndex:(NSUInteger)sourceIndex
                 toIndex:(NSUInteger)destinationIndex;

- (id)modelAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (NSUInteger)count;

@end
