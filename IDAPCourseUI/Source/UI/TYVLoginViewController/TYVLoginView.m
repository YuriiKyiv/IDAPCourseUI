//
//  TYVLoginView.m
//  IDAPCourseUI
//
//  Created by YURII on 24.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoginView.h"
#import "TYVUserModel.h"
#import "TYVMacro.h"
#import "TYVDispatch.h"

static NSString * const  kTYVButtonTitleLogIn = @"LogIn";
static NSString * const  kTYVButtonTitleLogOut = @"LogOut";

@interface TYVLoginView ()

@end

@implementation TYVLoginView

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TYVUserModel *)model {
    if (model != _model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
        
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TYVUserModel *)model {
    NSString *title = model.ID ? kTYVButtonTitleLogOut : kTYVButtonTitleLogIn;
    [self.loginButton setTitle:title forState:UIControlStateNormal];
    NSLog(@"%@", title);
}

#pragma mark -
#pragma mark Model observer

- (void)modelDidLoad:(TYVUserModel *)model {
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        [self fillWithModel:model];
    });
    
}

- (void)modelDidUnload:(id)model {
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        [self fillWithModel:model];
    });
}

@end
