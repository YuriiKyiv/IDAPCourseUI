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
- (void)dataModelDidUnload:(TYVAbstractDataModel *)dataModel;

- (void)dataModelWillLoad:(TYVAbstractDataModel *)dataModel;

- (void)dataModelDidLoad:(TYVAbstractDataModel *)dataModel;

- (void)dataModelDidFailedLoading:(TYVAbstractDataModel *)dataModel;

- (void)dataModel:(TYVAbstractDataModel *)dataModel didChangeWithObject:(id)object;

@end
