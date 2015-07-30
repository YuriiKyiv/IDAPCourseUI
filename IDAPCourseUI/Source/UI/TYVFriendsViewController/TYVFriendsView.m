//
//  TYVFriendsView.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFriendsView.h"
#import "TYVUserModel.h"
#import "TYVDispatch.h"

@implementation TYVFriendsView

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self showLoadingView];
}

@end
