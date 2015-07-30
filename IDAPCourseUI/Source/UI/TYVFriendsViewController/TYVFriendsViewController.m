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
#import "TYVModelArray.h"
#import "TYVMacro.h"
#import "TYVFriendsView.h"
#import "TYVDispatch.h"
#import "TYVFriendCell.h"
#import "TYVFriendDetailViewController.h"

#import "UITableView+TYVExtentions.h"

TYVViewControllerProperty(TYVFriendsViewController, friendsView, TYVFriendsView)

@implementation TYVFriendsViewController

#pragma mark -
#pragma mark Accessors

- (Class)contextClassName {
    return [TYVUsersContext class];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendsView.model = self.model;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYVFriendCell *cell = [tableView reusableCellWithClass:[TYVFriendCell class]];
    
    cell.model = self.model.friends[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TYVFriendDetailViewController *controller = [TYVFriendDetailViewController new];
    controller.model = self.model.friends[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Model observer

- (void)userFriendsDidLoad:(TYVUserModel *)model {
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        [self.friendsView.tableView reloadData];
        [self.friendsView hideLoadingView];
    });
    
}

- (void)modelWillLoad:(id)model {
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        [self.friendsView showLoadingView];
    });
}

@end
