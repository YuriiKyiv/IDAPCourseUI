//
//  TYVLoadingView.h
//  IDAPCourseUI
//
//  Created by YURII on 30.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYVLoadingView : UIView
@property (nonatomic, readonly, getter=isRunning) BOOL    running;

- (void)showLoading;

- (void)hideLoading;

@end