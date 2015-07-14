//
//  TYVLoadingViewHolder.m
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingViewHolder.h"
#import "UINib+TYVExtentions.h"
#import "TYVLoadingView.h"
#import "TYVLoadingViewProtocol.h"

@implementation TYVLoadingViewHolder

@dynamic visibleLoadingView;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

#pragma mark -
#pragma mark Accsecors

- (BOOL)isVisibleLoadingView {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingView = [TYVLoadingView viewInSuperview:self];
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    [self bringSubviewToFront:self.loadingView];
    [self.loadingView showLoadingView];
}

- (void)hideLoadingView {
    [self.loadingView hideLoadingView];
    
}

@end
