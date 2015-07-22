//
//  TYVUserContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUserContext.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "TYVUserModel.h"

static CGSize   TYVImageSize =  {100, 100};

@implementation TYVUserContext

#pragma mark -
#pragma mark Class Methods

+ (TYVUserModel *)userModelWithModel:(TYVUserModel *)model {
    TYVUserModel *user = nil;
    if ([FBSDKAccessToken currentAccessToken]) {
        user = [TYVUserModel new];
        FBSDKProfile *profile = [FBSDKProfile currentProfile];
        user.ID = profile.userID;
        user.firstName = profile.firstName;
        user.lastName = profile.lastName;
        user.imagePath = [profile imagePathForPictureMode:FBSDKProfilePictureModeSquare
                                                     size:TYVImageSize];
    }
    
    return user;
}

@end
