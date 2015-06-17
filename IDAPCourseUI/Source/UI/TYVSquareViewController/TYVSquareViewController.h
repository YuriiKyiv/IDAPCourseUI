//
//  TYVSquareViewController.h
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVSquare;

@interface TYVSquareViewController : UIViewController
@property (nonatomic, strong)   TYVSquare   *square;

- (IBAction)onClickNextButton:(id)sender;
- (IBAction)onClickRandomButton:(id)sender;

@end
