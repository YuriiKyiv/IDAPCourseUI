//
//  TYVLoadingView.m
//  IDAPCourseUI
//
//  Created by YURII on 30.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingView.h"
#import "TYVDispatch.h"

static const NSTimeInterval TYVDuration     =   1.0;
static const CGFloat        TYVShowAlpha    =   0.5;
static const CGFloat        TYVHideAlpha    =   0.0;

@interface TYVLoadingView ()
@property (nonatomic, assign)   BOOL visible;

- (void)animateLoadingView;

@end

@implementation TYVLoadingView

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.bounds = [[self superview] bounds];
    self.visible = NO;
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    if (self.visible) {
        return;
    }
    
    [self animateLoadingView];
}

- (void)hideLoadingView {
    if (!self.visible) {
        return;
    }
    
    [self animateLoadingView];
}

#pragma mark -
#pragma mark Private Methods

- (void)animateLoadingView {
    BOOL visible = !self.visible;
    
    (visible) ? [self.spinnerView startAnimating] : [self.spinnerView stopAnimating];

    [UIView animateWithDuration:TYVDuration animations:^{
        self.alpha = (visible) ? TYVShowAlpha : TYVHideAlpha;
    }];
    
    self.visible = visible;
}

@end
