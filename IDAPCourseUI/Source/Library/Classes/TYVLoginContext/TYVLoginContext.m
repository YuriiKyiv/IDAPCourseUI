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

@implementation TYVLoginContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
    {
        if (error) {
            NSLog(@"Error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            if ([result.grantedPermissions containsObject:@"email"]) {
                NSLog(@"Ok");
            }
        }
    }];
}

@end
