//
//  TYVFriendDetailView.m
//  IDAPCourseUI
//
//  Created by YURII on 28.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFriendDetailView.h"
#import "TYVUserModel.h"
#import "TYVDispatch.h"
#import "TYVMacro.h"
#import "TYVImageView.h"

@implementation TYVFriendDetailView

- (void)setModel:(TYVUserModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
        
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TYVUserModel *)model {
    self.nameLabel.text = model.firstName;
}

@end
