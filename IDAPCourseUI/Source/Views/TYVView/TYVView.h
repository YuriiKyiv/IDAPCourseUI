//
//  TYVView.h
//  IDAPCourseUI
//
//  Created by YURII on 30.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingViewHolder.h"

@class TYVUserModel;

@interface TYVView : TYVLoadingViewHolder
@property (nonatomic, strong)   TYVUserModel    *model;

// This method for overriding
- (void)fillWithModel:(TYVUserModel *)model;

@end
