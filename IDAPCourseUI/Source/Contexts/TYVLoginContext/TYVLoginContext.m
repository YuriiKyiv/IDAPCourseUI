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

static NSString * const kTYVPublicProfile = @"public_profile";
static NSString * const kTYVEmail = @"email";
static NSString * const kTYVUserFriends = @"user_friends";

@interface TYVLoginContext ()
@property (nonatomic, strong)   NSArray *permissions;

- (void)performWork;
- (void)request;

@end

@implementation TYVLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Accessors

- (NSArray *)permissions {
    return @[kTYVPublicProfile, kTYVEmail, kTYVUserFriends];
}

#pragma mark -
#pragma mark Private Methods

- (void)performWork {
    self.model.ID = [FBSDKAccessToken currentAccessToken].userID;
}

- (void)fillModel:(TYVUserModel *)model {
    if (![FBSDKAccessToken currentAccessToken]) {
        [self request];
    } else {
        [self fillModel:self.model];
    }
}

- (void)request {
    self.login = [[FBSDKLoginManager alloc] init];
    [self.login logInWithReadPermissions:self.permissions
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
