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

- (CGPoint)pointFromSquarePosition:(TYVSquarePositionType)squarePosition;
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
        UILabel *label = self.squareLable;
        CGRect rect = {[self pointFromSquarePosition:squarePosition], label.frame.size};
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
    UILabel *label = self.squareLable;
    CGRect rect = {point, self.squareLable.frame.size};
    [UIView animateWithDuration:TYVDuration
                          delay:TYVDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                                    label.frame = rect;
                                }
                     completion:nil];
}

- (CGPoint)pointFromSquarePosition:(TYVSquarePositionType)squarePosition {
    CGPoint point;
    
    switch (squarePosition) {
        case TYVUpperLeftCorner:
            point.x = 0;
            point.y = 0;
            break;
            
        case TYVUpperRightCorner:
            point.x = [[UIScreen mainScreen] bounds].size.width;
            point.y = 0;
            break;
            
        case TYVBottomRightCorner:
            point.x = [[UIScreen mainScreen] bounds].size.width;
            point.y = [[UIScreen mainScreen] bounds].size.height;
            break;
            
        case TYVBottomLeftCorner:
            point.x = 0;
            point.y = [[UIScreen mainScreen] bounds].size.height;
            break;
            
        default:
            break;
    }
    
    UILabel *label = self.squareLable;
    if (point.x != 0) {
        point.x -= label.frame.size.width;
    }
    
    if (point.y != 0) {
        point.y -= label.frame.size.height;
    }
    
    return point;
}

@end
