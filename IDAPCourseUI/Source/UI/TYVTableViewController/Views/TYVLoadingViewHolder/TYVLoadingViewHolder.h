//
//  TYVLoadingViewHolder.h
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

// if you want to overloading awakeFromNib you have to call connectLoadingView

@protocol TYVLoadingViewProtocol;

@interface TYVLoadingViewHolder : UIView
@property (nonatomic, strong)   IBOutlet UIView<TYVLoadingViewProtocol>  *loadingView;

@property (nonatomic, readonly, getter=isVisibleLoadingView)   BOOL    visibleLoadingView;


// shound not call this method directly
- (void)connectLoadingView;

- (void)showLoadingView;

- (void)hideLoadingView;

// this method for overloading instead awakeFromNib
// Never overload awakeFromNib
- (void)prepareView;

@end
