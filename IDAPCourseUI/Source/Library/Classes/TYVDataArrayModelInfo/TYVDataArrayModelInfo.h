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
@property (nonatomic, assign)   TYVDataArraModelChangeState changeState;
@property (nonatomic, strong)   id                          changing;


+ (instancetype)infoWithChangeState:(NSUInteger)state changing:(id)changing;

- (instancetype)initWithChangeState:(NSUInteger)state changing:(id)changing;

@end
