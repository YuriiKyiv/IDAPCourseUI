//
//  TYVLoaddingTableView.m
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoaddingTableView.h"

@implementation TYVLoaddingTableView

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    id object = [UINib objectWithClass:[TYVLoadingView class]];
    [self addSubview:object];
    self.loadingView = object;
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    [self.loadingView showLoadingView];
}

- (void)hideLoadingView {
    [self.loadingView hideLoadingView];
    
}

@end
