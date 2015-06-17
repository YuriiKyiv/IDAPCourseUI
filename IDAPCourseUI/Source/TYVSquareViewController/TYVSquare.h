//
//  TYVSquare.h
//  IDAPCourseUI
//
//  Created by YURII on 16.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TYVSquarePositionType){
    TYVUpperLeftCorner,
    TYVUpperRightCorner,
    TYVBottomRightCorner,
    TYVBottomLeftCorner,
    TYVSquarePositionTypeCount
};

@interface TYVSquare : NSObject
@property  (nonatomic, assign)  TYVSquarePositionType  position;

- (instancetype)initWithSquarePosition:(TYVSquarePositionType)position;

@end
