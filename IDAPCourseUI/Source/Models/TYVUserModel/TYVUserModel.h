//
//  TYVUserModel.h
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractDataModel.h"

@class TYVImageModel;

@interface TYVUserModel : TYVAbstractDataModel
@property (nonatomic, readonly) NSString    *firstName;
@property (nonatomic, readonly) NSString    *lastName;

@property (nonatomic, readonly) TYVImageModel   *imageModel;

@end
