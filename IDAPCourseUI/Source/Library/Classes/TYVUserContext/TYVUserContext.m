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
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKProfile *profile = [FBSDKProfile currentProfile];
        model.ID = profile.userID;
        model.firstName = profile.firstName;
        model.lastName = profile.lastName;
        model.imagePath = [profile imagePathForPictureMode:FBSDKProfilePictureModeSquare
                                                     size:TYVImageSize];
        
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"/{friend-list-id}"
                                                                       parameters:nil
                                                                       HTTPMethod:@"GET"];
        
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {

        }];
    }
    
    return model;
}

@end
