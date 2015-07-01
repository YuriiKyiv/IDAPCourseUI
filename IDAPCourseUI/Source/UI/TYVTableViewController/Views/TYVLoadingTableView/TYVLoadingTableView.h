//
//  TYVLoadingTableView.h
//  IDAPCourseUI
//
//  Created by YURII on 01.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYVLoadingTableView : UIView
@property (nonatomic, strong)   IBOutlet id  loadingView;


// shound not call this method directly
- (void)connectLoadingView;

- (void)showLoadingView;

- (void)hideLoadingView;

@end
