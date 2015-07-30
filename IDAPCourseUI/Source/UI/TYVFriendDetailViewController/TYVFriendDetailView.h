//
//  TYVFriendDetailView.h
//  IDAPCourseUI
//
//  Created by YURII on 28.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYVView.h"

@class TYVImageView;
@class TYVUserModel;

@interface TYVFriendDetailView : TYVView
@property (nonatomic, strong) IBOutlet  TYVImageView    *imageView;
@property (nonatomic, strong) IBOutlet  UILabel         *nameLabel;

@end
