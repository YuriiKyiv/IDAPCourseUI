//
//  TYVLoginContext.m
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoginContext.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "TYVUserModel.h"
#import "TYVDispatch.h"

@interface TYVLoginContext ()

- (void)performWork;
- (void)request;

@end

@implementation TYVLoginContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    self.model.state = TYVModelWillLoad;
    TYVDispatchAsyncOnDefaultQueueWithBlock(^{
        [self performWork];
    });
}

#pragma mark -
#pragma mark Private Methods

- (void)performWork {
    if (![FBSDKAccessToken currentAccessToken]) {
        [self request];
    } else {
        [self fillModel:self.model];
    }
}

- (void)fillModel:(TYVUserModel *)model {
    self.model.ID = [FBSDKAccessToken currentAccessToken].userID;
    model.state = TYVModelLoaded;
}

- (void)request {
    self.login = [[FBSDKLoginManager alloc] init];
    [self.login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends", @"read_custom_friendlists"]
                                 handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
     {
         if (error) {
             NSLog(@"Error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"%@", result);
             self.result = result;
             [self fillModel:self.model];
         }
     }];
}

@end
