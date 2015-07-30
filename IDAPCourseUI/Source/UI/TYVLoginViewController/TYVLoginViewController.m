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
#import "TYVDispatch.h"
#import "TYVLoadingLoginContext.h"

#import "UIViewController+TYVExtentions.h"

TYVViewControllerProperty(TYVLoginViewController, loginView, TYVLoginView)

@interface TYVLoginViewController ()
@property (nonatomic, strong)   TYVLoginContext *loginContext;

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model;
- (void)logOut;

@end

@implementation TYVLoginViewController

#pragma mark -
#pragma mark Initialization and Dealocation

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.model = [TYVUserModel new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (Class)contextClassName {
    return [TYVLoadingLoginContext class];
}

- (void)setLoginContext:(TYVLoginContext *)loginContext {
    TYVContextSetter(loginContext)
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.model.ID) {
        [self pushFriendsViewControllerWithModel:self.model];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.loginView.model = self.model;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    TYVUserModel *model = self.model;
    if (model.ID) {
        [self logOut];
    } else {
        self.loginContext = [TYVLoginContext contextWithModel:model];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)logOut {
    [self.model zeroModel];
    [[[FBSDKLoginManager alloc] init] logOut];
}

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model {
    TYVFriendsViewController *controller = [TYVFriendsViewController controller];
    controller.model = [TYVUserModel new];
    [self.navigationController pushViewController:controller animated:YES];
    
}

#pragma mark -
#pragma mark Observer Model

- (void)userIDDidLoad:(TYVUserModel *)model {
    if (model.ID) {
        [self pushFriendsViewControllerWithModel:model];
    }
}

@end
