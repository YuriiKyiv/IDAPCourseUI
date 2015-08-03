//
//  TYVUserModel.h
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractDataModel.h"

typedef NS_ENUM(NSUInteger, TYVUserModelState) {
    TYVUserIDLoaded = TYVModelStateCount,
    TYVUserFriendsLoaded,
    TYVUserDetailLoaded
};

@class TYVImageModel;
@class TYVModelArray;

@interface TYVUserModel : TYVAbstractDataModel
@property (nonatomic, copy) NSString        *ID;
@property (nonatomic, copy) NSString        *firstName;
@property (nonatomic, copy) NSString        *lastName;

@property (nonatomic, strong) TYVModelArray *friends;

@property (nonatomic, copy)     NSURL           *imagePath;
@property (nonatomic, readonly) TYVImageModel   *imageModel;

- (void)zeroModel;

@end
