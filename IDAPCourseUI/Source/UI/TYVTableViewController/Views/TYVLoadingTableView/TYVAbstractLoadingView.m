//
//  TYVAbstractLoadingView.m
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractLoadingView.h"
#import "UINib+TYVExtentions.h"
#import "TYVLoadingView.h"
#import "TYVLoadingViewProtocol.h"

@implementation TYVAbstractLoadingView

@dynamic visible;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

#pragma mark -
#pragma mark Accsecors

- (BOOL)isVisible {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self connectLoadingView];
}

#pragma mark -
#pragma mark Public Methods

- (void)connectLoadingView {
    self.loadingView = [TYVLoadingView viewInSuperview:self];
}

- (void)showLoadingView {
    [self.loadingView showLoadingView];
}

- (void)hideLoadingView {
    [self.loadingView hideLoadingView];
    
}

@end
