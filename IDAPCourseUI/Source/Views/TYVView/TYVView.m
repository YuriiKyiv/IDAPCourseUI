//
//  TYVView.m
//  IDAPCourseUI
//
//  Created by YURII on 30.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVView.h"
#import "TYVUserModel.h"

@implementation TYVView

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
        
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self showLoadingView];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TYVUserModel *)model {
    
}

@end
