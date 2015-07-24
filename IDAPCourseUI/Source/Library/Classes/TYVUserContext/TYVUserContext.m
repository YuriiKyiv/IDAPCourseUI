//
//  TYVUserContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUserContext.h"
#import "TYVUserModel.h"

static CGSize   TYVImageSize =  {100, 100};

@interface TYVUserContext ()

@end

@implementation TYVUserContext

#pragma mark -
#pragma mark Public Methods

- (void)fillModel:(TYVUserModel *)model {
    model.state = TYVModelWillLoad;
    FBSDKProfile *profile = [FBSDKProfile currentProfile];
    model.ID = profile.userID;
    model.firstName = profile.firstName;
    model.lastName = profile.lastName;
    model.imagePath = [profile imagePathForPictureMode:FBSDKProfilePictureModeSquare
                                                  size:TYVImageSize];
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me/friendlists"
                                  parameters:nil
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error) {
        NSLog(@"Done");
    }];
    
    model.state = TYVModelLoaded;
}

@end
