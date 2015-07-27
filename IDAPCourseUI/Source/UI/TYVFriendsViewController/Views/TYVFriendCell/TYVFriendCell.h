//
//  TYVFriendCell.h
//  IDAPCourseUI
//
//  Created by YURII on 27.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVUserModel;
@class TYVImageView;

@interface TYVFriendCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *nameLabel;
@property (nonatomic, strong)   IBOutlet TYVImageView   *imageContentView;

@property (nonatomic, strong)   TYVUserModel    *model;

- (void)fillWithModel:(TYVUserModel *)model;

@end
