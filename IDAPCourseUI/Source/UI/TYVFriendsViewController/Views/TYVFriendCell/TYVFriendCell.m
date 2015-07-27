//
//  TYVFriendCell.m
//  IDAPCourseUI
//
//  Created by YURII on 27.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFriendCell.h"
#import "TYVUserModel.h"

@implementation TYVFriendCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TYVUserModel *)model {
    if (_model != model) {
        _model = model;
        [self fillWithModel:_model];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TYVUserModel *)model {
    self.nameLabel.text = model.firstName;
}

@end
