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
    
    [self.dataArray addObserver:self];
    
    [self.tableView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onClickAddButton:(id)sender {
    [self.dataArray addModel:[TYVDataModel modelWithRandomString]];
}

- (IBAction)onClickEditButton:(id)sender {
    UITableView *tableView = self.tableView.tableView;
    BOOL isEditing = tableView.editing;
    [tableView setEditing:!isEditing animated:YES];
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
    [self.dataArray moveModelAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArray removeModelAtIndex:indexPath.row];
    }
}

#pragma mark -
#pragma mark DataArrayModelProtocol

- (void)dataArrayDidChangeCount:(TYVDataArrayModel *)dataArray withObject:(NSIndexSet *)set {
    UITableView *tableView = self.tableView.tableView;
    [tableView beginUpdates];
    NSIndexPath *path = [NSIndexPath indexPathForRow:[set firstIndex] - 1 inSection:0];
    if ([tableView numberOfRowsInSection:0] < [self.dataArray count]) {
        [tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
    } else {
        NSIndexPath *path = [NSIndexPath indexPathForRow:[set firstIndex] inSection:0];
        [tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
    }
    [tableView endUpdates];
    NSLog(@"observer %lu", (unsigned long)[set firstIndex]);
}

@end
