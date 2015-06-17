//
//  TYVSquareView.m
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVSquareView.h"

static const NSTimeInterval TYVDuration =   1.0;
static const NSTimeInterval TYVDelay    =   0.0;

@interface TYVSquareView ()

- (CGRect)frameForSquarePosition:(TYVSquarePositionType)squarePosition;

@end

@implementation TYVSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquare:(TYVSquare *)square {
    if (_square != square) {
        _square = square;
    }
    
    self.squareLabel.frame = [self frameForSquarePosition:square.position];
}

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completion:nil];
}

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition
                 animated:(BOOL)animated
        completion:(void(^)(BOOL finished))block
{
    if (self.square.position != squarePosition) {
        NSTimeInterval duration = (animated) ? TYVDuration : 0;
        CGRect rect = [self frameForSquarePosition:squarePosition];
        [UIView animateWithDuration:duration
                              delay:TYVDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.squareLabel.frame = rect;
                         }
                         completion:^(BOOL finished){
                             if (block) {
                                 block(finished);
                             }
                         }];
    }
}


#pragma mark -
#pragma mark Private Methods

- (CGRect)frameForSquarePosition:(TYVSquarePositionType)squarePosition {
    CGRect frame = self.squareLabel.frame;
    CGPoint point = CGPointZero;
    CGRect bounds = self.bounds;
   
#define TYVCalculateCoordinate(coordinate, dimension) \
    point.coordinate = CGRectGet##dimension(bounds) - CGRectGet##dimension(frame);
    
    switch (squarePosition) {
        case TYVUpperRightCorner:
            TYVCalculateCoordinate(x, Width);
            break;
            
        case TYVBottomRightCorner:
            TYVCalculateCoordinate(x, Width);
            TYVCalculateCoordinate(y, Height);
            break;
            
        case TYVBottomLeftCorner:
            TYVCalculateCoordinate(y, Height);
            break;
            
        default:
            break;
    }
    
#undef TYVCalculateCoordinate
    
    frame.origin = point;
    
    return frame;
}

@end
