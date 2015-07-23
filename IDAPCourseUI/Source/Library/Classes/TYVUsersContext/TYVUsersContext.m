//
//  TYVUsersContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUsersContext.h"
#import "TYVUsersModel.h"

@interface TYVUsersContext ()


@end

@implementation TYVUsersContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    [self fillModel:self.model];
}

- (void)fillModel:(TYVUsersModel *)model {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    TYVAbstractDataModelState state = model.state;
    if (token || TYVModelUnloaded == state || TYVModelFailedLoading == state) {
        TYVUsersModel *model = self.model;
        FBSDKProfile *profile = [FBSDKProfile currentProfile];
        NSString *ID = profile.userID;
        
        if ([FBSDKAccessToken currentAccessToken]) {
            [[[FBSDKGraphRequest alloc] initWithGraphPath:ID parameters:nil]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     NSLog(@"fetched user:%@", result);
                 }
             }];
        }
        
        model.state = TYVModelLoaded;
    } else {
        model.state = TYVModelFailedLoading;
    }
}

@end
