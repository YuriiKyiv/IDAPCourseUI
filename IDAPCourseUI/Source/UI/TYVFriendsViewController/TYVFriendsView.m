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

- (void)dealloc {
    self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TYVUserModel *)model {
    if (model != _model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
        [_model notify];
    }
}

#pragma mark -
#pragma mark Model observer

- (void)modelDidLoad:(TYVUserModel *)model {
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        [self.tableView reloadData];
        [self hideLoadingView];
    });
    
}

- (void)modelWillLoad:(id)model {
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        [self showLoadingView];
    });
}

@end
