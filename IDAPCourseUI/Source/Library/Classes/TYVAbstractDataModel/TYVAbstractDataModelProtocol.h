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
- (void)dataModelUnloaded:(TYVAbstractDataModel *)dataModel;

- (void)dataModelLoading:(TYVAbstractDataModel *)dataModel;

- (void)dataModelLoaded:(TYVAbstractDataModel *)dataModel;

- (void)dataModelFailedLoading:(TYVAbstractDataModel *)dataModel;

- (void)dataModelDidChange:(TYVAbstractDataModel *)dataModel;

@end
