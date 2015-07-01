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

- (void)perfomLoadingView;

@end

@implementation TYVLoadingView

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.visible = NO;
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    if (self.visible) {
        return;
    }
    
    [self perfomLoadingView];
}

- (void)hideLoadingView {
    if (!self.visible) {
        return;
    }
    
    [self perfomLoadingView];
}

#pragma mark -
#pragma mark Private Methods

- (void)perfomLoadingView {
    BOOL visible = !self.visible;
    self.visible = visible;
    SEL selector = (visible) ? @selector(startAnimating) : @selector(stopAnimating);
    [self.spinnerView performSelector:selector];
    CGFloat alpha = (visible) ? TYVShowAlpha : TYVHideAlpha;
    [UIView animateWithDuration:TYVDuration animations:^{
        self.alpha = alpha;
    }];
}

@end
