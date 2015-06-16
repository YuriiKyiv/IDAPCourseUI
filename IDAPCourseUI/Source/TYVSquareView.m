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
    if (_squarePosition != squarePosition) {
        NSTimeInterval duration = (animated) ? TYVDuration : 0;
        UILabel *label = self.squareLabel;
        CGRect rect = [self frameForSquarePosition:squarePosition];
        [UIView animateWithDuration:duration
                              delay:TYVDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             label.frame = rect;
                         }
                         completion:^(BOOL finished){
                             if (finished) {
                                 _squarePosition = squarePosition;
                             };
                             
                             if (block) {
                                 block(finished);
                             }
                         }];
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
