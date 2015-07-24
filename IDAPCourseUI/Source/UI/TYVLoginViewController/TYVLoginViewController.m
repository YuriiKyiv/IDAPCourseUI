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

@interface TYVLoginViewController ()
@property (nonatomic, strong)   TYVUserModel    *userModel;
@property (nonatomic, strong)   TYVLoginContext *loginContext;

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model;
- (void)prerareModel;

@end

@implementation TYVLoginViewController

#pragma mark -
#pragma mark Initialization and Dealocation

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.userModel = [TYVUserModel new];
        [self prerareModel];
    }
    
    return self;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    TYVUserModel *model = self.userModel;
    if (model.ID) {
        [self pushFriendsViewControllerWithModel:model];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.loginView.model = self.userModel;
}

#pragma mark -
#pragma mark Private Methods

- (void)prerareModel {
    self.userModel.ID = [FBSDKAccessToken currentAccessToken].userID;
}

- (void)pushFriendsViewControllerWithModel:(TYVUserModel *)model {
    TYVFriendsViewController *controller = [TYVFriendsViewController new];
    [self.navigationController pushViewController:controller animated:YES];
    
}

@end
