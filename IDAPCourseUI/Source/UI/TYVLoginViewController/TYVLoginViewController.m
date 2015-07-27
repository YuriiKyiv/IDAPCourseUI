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

TYVViewControllerProperty(TYVLoginViewController, loginView, TYVLoginView)

@interface TYVLoginViewController ()
@property (nonatomic, strong)   TYVUserModel    *userModel;
@property (nonatomic, strong)   TYVLoginContext *loginContext;

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model;
- (void)prerareModel;

@end

@implementation TYVLoginViewController

#pragma mark -
#pragma mark Initialization and Dealocation

- (void)dealloc {
    self.userModel = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.userModel = [TYVUserModel new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(TYVUserModel *)userModel {
    if (_userModel != userModel) {
        [_userModel removeObserver:self];
        
        _userModel = userModel;
        [_userModel addObserver:self];
        
        [self prerareModel];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        self.loginView.model = self.userModel;
    });
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    TYVUserModel *model = self.userModel;
    if (model.ID) {
        [[[FBSDKLoginManager alloc] init] logOut];
        model.ID = nil;
        model.state = TYVModelUnloaded;
    } else {
        self.loginContext = [TYVLoginContext contextWithModel:self.userModel];
        [self.loginContext execute];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)prerareModel {
    self.userModel.ID = [FBSDKAccessToken currentAccessToken].userID;
}

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model {
//    TYVFriendsViewController *controller = [TYVFriendsViewController new];
//    controller.model = model;
//    [self.navigationController pushViewController:controller animated:YES];
    
}

#pragma mark -
#pragma mark Observer Model

- (void)modelDidLoad:(TYVUserModel *)model {
    if (model.ID) {
        [self pushFriendsViewControllerWithModel:model];
    }
}

@end
