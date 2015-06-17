//
//  TYVSquareView.h
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYVSquare.h"

@interface TYVSquareView : UIView
@property (nonatomic, strong)   IBOutlet    UILabel     *squareLabel;
@property (nonatomic, strong)   IBOutlet    UIButton    *nextButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *randomButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *stopButton;

@property (nonatomic, strong)   TYVSquare   *square;

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition;

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition
                 animated:(BOOL)animated;

- (void)setSquarePosition:(TYVSquarePositionType)squarePosition
                 animated:(BOOL)animated
               completion:(void(^)(BOOL finished))block;

@end
