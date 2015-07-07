//
//  TYVDataArrayModelInfo.h
//  IDAPCourseUI
//
//  Created by YURII on 24.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TYVDataArraModelChangeState) {
    TYVDataArrayModelInsert,
    TYVDataArrayModelDelete,
    TYVDataArrayModelMove
};

@interface TYVDataArrayModelInfo : NSObject
@property (nonatomic, readonly)   TYVDataArraModelChangeState changeState;
@property (nonatomic, readonly)   id<NSCopying>               changing;


+ (instancetype)infoWithChangeState:(NSUInteger)state changing:(id<NSCopying>)changing;

- (instancetype)initWithChangeState:(NSUInteger)state changing:(id<NSCopying>)changing;

@end
