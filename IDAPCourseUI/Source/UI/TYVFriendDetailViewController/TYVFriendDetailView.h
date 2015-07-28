//
//  TYVFriendDetailView.h
//  IDAPCourseUI
//
//  Created by YURII on 28.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVImageView;
@class TYVUserModel;

@interface TYVFriendDetailView : UIView
@property (nonatomic, strong) IBOutlet  TYVImageView    *imageView;
@property (nonatomic, strong) IBOutlet  UILabel         *nameLabel;

@property (nonatomic, strong) TYVUserModel  *model;

- (void)fillWithModel:(TYVUserModel *)model;

@end
