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
#import "UITableView+TYVExtentions.h"
#import "TYVDataArrayModel.h"
#import "TYVDataModel.h"

#import "UINib+TYVExtentions.h"

TYVViewControllerProperty(TYVTableViewController, tableView, TYVTableView)

@interface TYVTableViewController ()

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
#pragma mark Interface Handling

- (IBAction)onClickAddButton:(id)sender {
    [self.dataArray addModel:[TYVDataModel new]];
    [self.tableView.tableView reloadData];
}

- (IBAction)onClickEditButton:(id)sender {
    self.tableView.tableView.editing = YES;
    [self.tableView.tableView setEditing:YES animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYVDataCell *cell = [tableView dequeueReusableCellWithClass:[TYVDataCell class]];
    
    cell.data = self.dataArray[indexPath.row];
    
    return cell;
}

@end
