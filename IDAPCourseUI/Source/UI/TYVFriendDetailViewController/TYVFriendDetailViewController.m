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

@implementation TYVFriendDetailViewController

#pragma mark -
#pragma mark Accessors

- (Class)contextClassName {
    return [TYVUserContext class];
}

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
