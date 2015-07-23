//
//  TYVLoginViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "TYVLoginViewController.h"
#import "TYVFriendsViewController.h"

@interface TYVLoginViewController () <FBSDKLoginButtonDelegate>

@end

@implementation TYVLoginViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (token) {
        TYVFriendsViewController *controller = [TYVFriendsViewController new];
        [self.navigationController pushViewController:controller animated:NO];
    }
}

#pragma mark -
#pragma mark FBSDKLoginButtonDelegate

- (void)    loginButton:(FBSDKLoginButton *)loginButton
  didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                  error:(NSError *)error {
    TYVFriendsViewController *controller = [TYVFriendsViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

@end
