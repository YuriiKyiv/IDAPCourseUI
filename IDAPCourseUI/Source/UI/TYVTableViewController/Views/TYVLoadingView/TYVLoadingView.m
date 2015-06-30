//
//  TYVLoadingView.m
//  IDAPCourseUI
//
//  Created by YURII on 30.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingView.h"
#import "TYVDispatch.h"

static const NSTimeInterval TYVDuration     =   2.0;
static const CGFloat        TYVShowAlpha    =   0.5;
static const CGFloat        TYVHideAlpha    =   0;

@implementation TYVLoadingView

#pragma mark -
#pragma mark Public Methods

- (void)showLoading {
    TYVDispatchSyncOnMainQueueWithBlock(^{
        [UIView animateWithDuration:TYVDuration animations:^{
            self.alpha = TYVShowAlpha;
        }];
    });
}

- (void)hideLoading {
    TYVDispatchSyncOnMainQueueWithBlock(^{
        [UIView animateWithDuration:TYVDuration animations:^{
            self.alpha = TYVHideAlpha;
        }];
    });
}

@end
