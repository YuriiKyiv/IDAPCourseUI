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
    TYVDataArrayModelUnLoaded,
    TYVDataArrayModelLoaded,
    TYVDataArrayDidChange
};

@interface TYVDataArrayModel : TYVProtocolObservableObject <NSCoding>
@property (nonatomic, readonly) NSArray *dataArray;

+ (instancetype)dataWithModelsCount:(NSUInteger)count;

- (instancetype)initWithModelsCount:(NSUInteger)count;

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

- (void)load;
- (void)save;

@end
