//
//  TYVFriendDetailViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFriendDetailViewController.h"
#import "TYVUserContext.h"
#import "TYVUserModel.h"
#import "TYVFriendDetailView.h"
#import "TYVMacro.h"

TYVViewControllerProperty(TYVFriendDetailViewController, friendDetailView, TYVFriendDetailView)

@interface TYVFriendDetailViewController ()

@end

@implementation TYVFriendDetailViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendDetailView.model = self.model;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
