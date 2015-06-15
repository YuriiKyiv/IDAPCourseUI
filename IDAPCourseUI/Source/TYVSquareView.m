//
//  TYVSquareView.m
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVSquareView.h"

@interface TYVSquareView ()

- (CGPoint)pointFromSquarePosition:(TYVSquarePositionType)squarePosition;
- (void)moveSquare:(CGPoint)rect;

@end

@implementation TYVSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition {
    [self setSquarePosition:squarePosition animated:NO completionHandler:nil];
}

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition
                 animated:(BOOL)animated
        completionHandler:(SEL)handler
{
    [self moveSquare:[self pointFromSquarePosition:squarePosition]];
    _squarePosition = squarePosition;
}


#pragma mark -
#pragma mark Private Methods

- (void)moveSquare:(CGPoint)point {
    CGRect rect = {point, self.squareLable.frame.size};
    self.squareLable.frame = rect;
}

- (CGPoint)pointFromSquarePosition:(TYVSquarePositionType)squarePosition {
    CGPoint point;
    point.x = 0;
    point.y = 0;
    
    if (squarePosition == TYVUpperLeftCorner) {
        return point;
    } else if (squarePosition == TYVUpperRightCorner) {
        point.x = [[UIScreen mainScreen] bounds].size.width - 50;
        point.y = 0;
        return point;
    } else if (squarePosition == TYVBottomRightCorner) {
        point.x = [[UIScreen mainScreen] bounds].size.width - 50;
        point.y = [[UIScreen mainScreen] bounds].size.height - 50;
        return point;
    }   else if (squarePosition == TYVBottomLeftCorner) {
        point.x = 0;
        point.y = [[UIScreen mainScreen] bounds].size.height - 50;
        return point;
    }
    
    return point;
}

@end
