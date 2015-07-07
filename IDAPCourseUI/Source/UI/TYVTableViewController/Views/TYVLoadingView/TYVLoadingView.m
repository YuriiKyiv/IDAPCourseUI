//
//  TYVLoadingView.m
//  IDAPCourseUI
//
//  Created by YURII on 30.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingView.h"
#import "TYVDispatch.h"

#import "UINib+TYVExtentions.h"

static const NSTimeInterval TYVDuration     =   1.0;
static const CGFloat        TYVShowAlpha    =   0.5;
static const CGFloat        TYVHideAlpha    =   0.0;

@interface TYVLoadingView ()
@property (nonatomic, assign)   BOOL visible;

- (void)animateLoadingViewWithState:(BOOL)visible;

@end

@implementation TYVLoadingView

#pragma mark -
#pragma mark Class Methods

- (instancetype)viewInSuperview:(UIView *)superview {
    id object = [UINib objectWithClass:[self class]];
    [object setBounds:self.bounds];
    
    return object;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.visible = NO;
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    [self animateLoadingViewWithState:YES];
}

- (void)hideLoadingView {
    [self animateLoadingViewWithState:NO];
}

#pragma mark -
#pragma mark Private Methods

- (void)animateLoadingViewWithState:(BOOL)visible {
    (visible) ? [self.spinnerView startAnimating] : [self.spinnerView stopAnimating];
    
    [UIView animateWithDuration:TYVDuration animations:^{
        self.alpha = (visible) ? TYVShowAlpha : TYVHideAlpha;
    } completion:^(BOOL finished) {
        if (finished) {
            self.visible = !visible;
        }
    }];
}

@end
