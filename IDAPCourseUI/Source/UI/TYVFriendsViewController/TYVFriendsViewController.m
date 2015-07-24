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
@property (nonatomic, strong)   TYVUsersContext *context;
@end

@implementation TYVFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TYVUserModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
        
        self.context = [TYVUsersContext contextWithModel:_model];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
