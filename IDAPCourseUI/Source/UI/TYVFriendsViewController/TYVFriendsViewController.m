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
#import "TYVDispatch.h"
#import "TYVFriendCell.h"

#import "UITableView+TYVExtentions.h"

TYVViewControllerProperty(TYVFriendsViewController, friendsView, TYVFriendsView)

@interface TYVFriendsViewController ()
@property (nonatomic, strong)   TYVUsersContext *context;
@end

@implementation TYVFriendsViewController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TYVUserModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
        
        self.context = [TYVUsersContext contextWithModel:_model];
        [self.context execute];
    }
}

- (void)setContext:(TYVUsersContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [_context execute];
    }
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

@end
