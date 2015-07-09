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
- (void)modelDidUnload:(TYVAbstractDataModel *)dataModel;

- (void)modelWillLoad:(TYVAbstractDataModel *)dataModel;

- (void)modelDidLoad:(TYVAbstractDataModel *)dataModel;

- (void)modelDidFailedLoading:(TYVAbstractDataModel *)dataModel;

- (void)model:(TYVAbstractDataModel *)dataModel didChangeWithObject:(id)object;

@end
