//
//  TYVLoginView.h
//  IDAPCourseUI
//
//  Created by YURII on 24.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVUserModel;

@interface TYVLoginView : UIView
@property (nonatomic, strong)   IBOutlet UIButton   *loginButton;

@property (nonatomic, strong)   TYVUserModel    *model;

- (void)fillWithModel:(TYVUserModel *)model;

@end
