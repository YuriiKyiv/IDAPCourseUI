//
//  TYVFriendsViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFriendsViewController.h"
#import "TYVUserContext.h"
#import "TYVUsersContext.h"
#import "TYVUserModel.h"
#import "TYVUsersModel.h"
#import "TYVMacro.h"
#import "TYVFriendsView.h"

TYVViewControllerProperty(TYVFriendsViewController, friendsView, TYVFriendsView)

@interface TYVFriendsViewController ()
@property (nonatomic, strong)   TYVUsersModel   *model;

@end

@implementation TYVFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TYVUserModel *model = [TYVUserModel new];
    TYVUserContext *context = [TYVUserContext contextWithModel:model];
    [context execute];
    
    TYVUsersModel *models = [TYVUsersModel new];
    TYVUsersContext *contexts = [TYVUsersContext contextWithModel:models];
    [contexts execute];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
