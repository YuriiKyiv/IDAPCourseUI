//
//  TYVUserModel.h
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractDataModel.h"

typedef NS_ENUM(NSUInteger, TYVUserModelState) {
    TYVUserModelIDLoaded = TYVModelLoaded,
    TYVUserModelFriendsLoaded = TYVModelStateCount,
    TYVUserModelDetailLoaded
};

@class TYVImageModel;
@class TYVUsersModel;

@interface TYVUserModel : TYVAbstractDataModel
@property (nonatomic, copy) NSString        *ID;
@property (nonatomic, copy) NSString        *firstName;
@property (nonatomic, copy) NSString        *lastName;
@property (nonatomic, copy) TYVUsersModel   *friends;

@property (nonatomic, copy)     NSString        *imagePath;
@property (nonatomic, readonly) TYVImageModel   *imageModel;

@end
