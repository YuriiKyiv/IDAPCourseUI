//
//  TYVImageProtocol.h
//  IDAPCourseUI
//
//  Created by YURII on 29.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYVDataModel;

@protocol TYVImageProtocol <NSObject>

@optional
- (void)dataModelDidLoadImage:(TYVDataModel *)dataModel;

@end
