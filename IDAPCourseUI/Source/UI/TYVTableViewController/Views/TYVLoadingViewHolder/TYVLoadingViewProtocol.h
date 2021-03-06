//
//  TYVLoadingViewProtocol.h
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TYVLoadingViewProtocol <NSObject>
@property (nonatomic, readonly, getter=isVisible)   BOOL    visible;

- (void)showLoadingView;

- (void)hideLoadingView;

@end
