//
//  TYVSquareView.m
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVSquareView.h"

@interface TYVSquareView ()

@end

@implementation TYVSquareView

@dynamic squarePosition;

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(TYVSquarePositionType *)squarePosition {
    [self setSquarePosition:squarePosition animated:NO completionHandler:nil];
}

- (void)setSquarePosition:(TYVSquarePositionType *)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(TYVSquarePositionType *)squarePosition
                 animated:(BOOL)animated
        completionHandler:(SEL)handler
{
    CGRect rect = self.squareLable.frame;
    rect.origin.x += 10;
    rect.origin.x += 10;
    [self moveSquare:rect];
}

- (TYVSquarePositionType *)squarePosition {
    return 0;
}


#pragma mark -
#pragma mark Private Methods

- (void)moveSquare:(CGRect)rect {
    self.squareLable.frame = rect;
}

@end
