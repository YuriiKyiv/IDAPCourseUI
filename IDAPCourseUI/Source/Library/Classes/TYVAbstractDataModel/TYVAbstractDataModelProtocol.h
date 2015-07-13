//
//  TYVAbstractDataModelProtocol.h
//  IDAPCourseUI
//
//  Created by YURII on 02.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYVAbstractDataModel;

@protocol TYVAbstractDataModelProtocol <NSObject>

@optional
- (void)modelDidUnload:(id)model;

- (void)modelWillLoad:(id)model;

- (void)modelDidLoad:(id)model;

- (void)modelDidFailedLoading:(id)model;

- (void)model:(id)model didChangeWithObject:(id)object;

@end
