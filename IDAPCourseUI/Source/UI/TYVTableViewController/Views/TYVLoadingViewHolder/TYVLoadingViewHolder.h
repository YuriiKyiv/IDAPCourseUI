//
//  TYVLoadingViewHolder.h
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TYVLoadingViewProtocol;

@interface TYVLoadingViewHolder : UIView
@property (nonatomic, strong)   IBOutlet UIView<TYVLoadingViewProtocol>  *loadingView;

@property (nonatomic, readonly, getter=isVisibleLoadingView)   BOOL    visibleLoadingView;

- (void)showLoadingView;

- (void)hideLoadingView;

@end
