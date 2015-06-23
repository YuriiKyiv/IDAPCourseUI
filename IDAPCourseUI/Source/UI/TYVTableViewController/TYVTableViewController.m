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
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.dataArray = nil;
}


#pragma mark -
#pragma mark Accessors

- (void)setDataArray:(TYVDataArrayModel *)dataArray {
    if (_dataArray != dataArray) {
        [_dataArray removeObserver:self.tableView];
        
        _dataArray = dataArray;
        [_dataArray addObserver:self.tableView];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataArray addObserver:self.tableView];
    
    [self.tableView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onClickAddButton:(id)sender {
    [self.dataArray addModel:[TYVDataModel new]];
    
    UITableView *tableView = self.tableView.tableView;
    
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:[self.dataArray count] - 1 inSection:0]]
                     withRowAnimation:UITableViewRowAnimationLeft];
    [tableView endUpdates];
}

- (IBAction)onClickEditButton:(id)sender {
    BOOL isEditing = self.tableView.tableView.editing;
    [self.tableView.tableView setEditing:!isEditing animated:YES];
    
//    self.tableView.addButton.titleLabel = isEditing ? @"Done" : @"Edit";
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

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.dataArray exchangeModelAtIndex:sourceIndexPath.row withModelAtIndex:destinationIndexPath.row];
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArray removeModelAtIndex:indexPath.row];
    }
}

@end
