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
- (void)moveSquareToPoint:(CGPoint)rect;

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
    if (_squarePosition != squarePosition) {
        NSTimeInterval delay = (animated) ? TYVDelay : 0;
        UILabel *label = self.squareLabel;
        CGRect rect = [self frameForSquarePosition:squarePosition];
        [UIView animateWithDuration:TYVDuration
                              delay:delay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             label.frame = rect;
                         }
                         completion:^(BOOL finished){
                             if (finished) {
                                 _squarePosition = squarePosition;
                             };
                         }];
        if (handler) {
            [self performSelector:handler];
        }
    }
}


#pragma mark -
#pragma mark Private Methods

- (void)moveSquareToPoint:(CGPoint)point {
    UILabel *label = self.squareLabel;
    CGRect rect = {point, self.squareLabel.frame.size};
    [UIView animateWithDuration:TYVDuration
                          delay:TYVDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                                    label.frame = rect;
                                }
                     completion:nil];
}

- (CGRect)frameForSquarePosition:(TYVSquarePositionType)squarePosition {
    CGRect frame = self.squareLabel.frame;
    CGPoint point = CGPointZero;
    CGRect bounds = self.superview.bounds;

    
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
