//
//  TYVSquareView.h
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TYVSquarePositionType){
    TYVUpperLeftCorner,
    TYVUpperRightCorner,
    TYVBottomRightCorner,
    TYVBottomLeftCorner
};

@interface TYVSquareView : UIView
@property (nonatomic, strong)   IBOutlet    UILabel     *squareLable;
@property (nonatomic, strong)   IBOutlet    UIButton    *nextButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *randomButton;

@property (nonatomic, unsafe_unretained)    TYVSquarePositionType  *squarePosition;

- (void)moveSquare:(CGRect)rect;

@end
