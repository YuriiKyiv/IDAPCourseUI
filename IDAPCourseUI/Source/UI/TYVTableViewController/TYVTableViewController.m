//
//  TYVTableViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableViewController.h"
#import "TYVMacro.h"
#import "TYVTableView.h"
#import "TYVDataCell.h"
#import "UINib+TYVExtentions.h"
#import "UITableView+TYVExtentions.h"

TYVViewControllerProperty(TYVTableViewController, tableView, TYVTableView)

@interface TYVTableViewController ()

- (TYVTableViewCell *)tableView:(UITableView *)tableView nextCellWithClass:(Class)class;

@end

@implementation TYVTableViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Private Methods

- (TYVTableViewCell *)tableView:(UITableView *)tableView nextCellWithClass:(Class)class {
    TYVTableViewCell *cell = [tableView dequeueReusableCellWithClass:class];
    if (!cell) {
        cell = (TYVTableViewCell *)[UINib viewWithClass:class];
    }
    
    return cell;
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = [TYVDataCell class];
    
    TYVDataCell *cell = (TYVDataCell *)[self tableView:tableView nextCellWithClass:class];
    
    cell.data = self.data;
    
    return cell;
}

@end
