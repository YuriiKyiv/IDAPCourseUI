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

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TYVUserModel *)model {
    self.nameLabel.text = model.firstName;
    self.imageView.imageModel = model.imageModel;
}

#pragma mark -
#pragma mark Observer

- (void)userDetailsDidLoad:(id)model {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self);
        [self fillWithModel:model];
    });
}


@end
