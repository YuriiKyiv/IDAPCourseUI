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
@property (nonatomic, assign)   BOOL running;

@end

@implementation TYVLoadingView

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.running = NO;
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoading {
    @synchronized (self) {
        if (self.running) {
            return;
        }
        
        self.running = YES;
        TYVDispatchSyncOnMainQueueWithBlock(^{
            [UIView animateWithDuration:TYVDuration animations:^{
                self.alpha = TYVShowAlpha;
            }];
        });
    }
}

- (void)hideLoading {
    @synchronized (self) {
        if (!self.running) {
            return;
        }
        
        self.running = NO;
        TYVDispatchSyncOnMainQueueWithBlock(^{
            [UIView animateWithDuration:TYVDuration animations:^{
                self.alpha = TYVHideAlpha;
            }];
        });
    }
}

@end
