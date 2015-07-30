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
#import "TYVModelArray.h"

#import "UITableView+TYVExtentions.h"
#import "UIViewController+TYVExtentions.h"

TYVViewControllerProperty(TYVFriendsViewController, friendsView, TYVFriendsView)

@interface TYVFriendsViewController ()
@property (nonatomic, readonly) TYVModelArray   *friends;

@end

@implementation TYVFriendsViewController

@dynamic friends;

#pragma mark -
#pragma mark Accessors

- (Class)contextClassName {
    return [TYVUsersContext class];
}

- (id)friends {
    return self.model.friends;
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
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYVFriendCell *cell = [tableView reusableCellWithClass:[TYVFriendCell class]];
    
    cell.model = self.friends[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TYVFriendDetailViewController *controller = [TYVFriendDetailViewController controller];
    controller.model = self.friends[indexPath.row];
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
