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
#import "TYVMacro.h"
#import "TYVLoginView.h"
#import "TYVUserModel.h"
#import "TYVLoginContext.h"

TYVViewControllerProperty(TYVLoginViewController, loginView, TYVLoginView)

@interface TYVLoginViewController () <FBSDKLoginButtonDelegate>
@property (nonatomic, strong)   TYVUserModel    *userModel;
@property (nonatomic, strong)   TYVLoginContext *loginContext;

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model;

@end

@implementation TYVLoginViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    TYVUserModel *model = self.userModel;
    if (model.ID) {
        [self pushFriendsViewControllerWithModel:model];
    } else {
        self.userModel = [TYVUserModel new];
        self.loginContext = [TYVLoginContext contextWithModel:self.userModel];
        [self.loginContext execute];
    }
    
    self.loginView.model = self.userModel;
    
}

#pragma mark -
#pragma mark Private Methods

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model {
    TYVFriendsViewController *controller = [TYVFriendsViewController new];
    
}

#pragma mark -
#pragma mark FBSDKLoginButtonDelegate

- (void)    loginButton:(FBSDKLoginButton *)loginButton
  didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                  error:(NSError *)error
{

}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

@end
