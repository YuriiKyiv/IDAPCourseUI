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

- (void)pushFriendsViewController:(BOOL)animated;

@end

@implementation TYVLoginViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([FBSDKAccessToken currentAccessToken]) {
        [self pushFriendsViewController:NO];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)pushFriendsViewController:(BOOL)animated {
    TYVFriendsViewController *controller = [TYVFriendsViewController new];
    [self.navigationController pushViewController:controller animated:animated];
}

#pragma mark -
#pragma mark FBSDKLoginButtonDelegate

- (void)    loginButton:(FBSDKLoginButton *)loginButton
  didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                  error:(NSError *)error {
    [self pushFriendsViewController:YES];
    
    loginButton.readPermissions = @[@"email", @"read_custom_friendlists"];
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

@end
