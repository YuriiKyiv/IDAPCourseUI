//
//  TYVLoadingTableView.m
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingTableView.h"
#import "UINib+TYVExtentions.h"
#import "TYVLoadingView.h"

@implementation TYVLoadingTableView

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self connectLoadingView];
}

#pragma mark -
#pragma mark Public Methods

- (void)connectLoadingView {
    id object = [UINib objectWithClass:[TYVLoadingView class]];
    [self addSubview:object];
    self.loadingView = object;
}

- (void)showLoadingView {
    [self.loadingView showLoadingView];
}

- (void)hideLoadingView {
    [self.loadingView hideLoadingView];
    
}

@end
