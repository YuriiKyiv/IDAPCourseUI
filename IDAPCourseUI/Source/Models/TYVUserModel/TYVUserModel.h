//
//  TYVUserModel.h
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractDataModel.h"

@class TYVImageModel;
@class TYVUsersModel;

@interface TYVUserModel : TYVAbstractDataModel
@property (nonatomic, assign) NSUInteger    ID;
@property (nonatomic, strong) NSString      *firstName;
@property (nonatomic, strong) NSString      *lastName;
@property (nonatomic, strong) TYVUsersModel *friends;

@property (nonatomic, readonly) TYVImageModel   *imageModel;

@end
