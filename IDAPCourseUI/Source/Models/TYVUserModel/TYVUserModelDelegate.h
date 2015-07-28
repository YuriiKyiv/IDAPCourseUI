//
//  TYVUserModelDelegate.h
//  IDAPCourseUI
//
//  Created by YURII on 28.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TYVUserModelDelegate <NSObject>

@optional
- (void)userIDDidLoad:(id)model;

- (void)userFriendsDidLoad:(id)model;

- (void)userDetailsDidLoad:(id)model;

@end
