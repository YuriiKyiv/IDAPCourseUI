//
//  TYVLoaddingTableView.h
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYVLoaddingTableView : UIView
@property (nonatomic, strong)   IBOutlet id  loadingView;

- (void)showLoadingView;

- (void)hideLoadingView;

@end
