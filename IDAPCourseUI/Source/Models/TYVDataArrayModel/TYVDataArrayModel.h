//
//  TYVDataArrayModel.h
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVProtocolObservableObject.h"

@class TYVDataModel;

typedef NS_ENUM(NSUInteger, TYVDataModelArrayModelState) {
    TYVDataArrayDidNotChange,
    TYVDataArrayDidChange
};

@interface TYVDataArrayModel : TYVProtocolObservableObject
@property (nonatomic, readonly) NSArray *dataArray;

- (void)addModel:(TYVDataModel *)model;
- (void)removeModel:(TYVDataModel *)model;

- (void)insertModelAtIndex:(TYVDataModel *)model
                  index:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)exchangeModelAtIndex:(NSUInteger)sourceIndex
            withModelAtIndex:(NSUInteger)destinationIndex;

- (void)moveModelAtIndex:(NSUInteger)sourceIndex
                 toIndex:(NSUInteger)destinationIndex;

- (TYVDataModel *)modelAtIndex:(NSUInteger)index;
- (TYVDataModel *)objectAtIndexedSubscript:(NSUInteger)index;

- (NSUInteger)count;

@end
