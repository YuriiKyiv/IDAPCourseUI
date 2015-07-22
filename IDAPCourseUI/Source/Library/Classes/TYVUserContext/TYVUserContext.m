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
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (token) {
        NSSet *permission = token.permissions;
        FBSDKProfile *profile = [FBSDKProfile currentProfile];
        model.ID = token.userID;
        model.firstName = profile.firstName;
        model.lastName = profile.lastName;
        model.imagePath = [profile imagePathForPictureMode:FBSDKProfilePictureModeSquare
                                                     size:TYVImageSize];
        
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me/friendlists"
                                                                       parameters:nil
                                                                       HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                NSLog(@"result = %@", result);
            }
        }];
    }
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }
    
    return model;
}

@end
