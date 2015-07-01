//
//  TYVLoadingView.h
//  IDAPCourseUI
//
//  Created by YURII on 30.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYVLoadingView : UIView
@property (nonatomic, strong)   IBOutlet    UIActivityIndicatorView *spinnerView;

@property (nonatomic, readonly, getter=isVisible) BOOL    visible;

- (void)showLoadingView;

- (void)hideLoadingView;

@end
