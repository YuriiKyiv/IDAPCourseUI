//
//  TYVTableViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableViewController.h"
#import "TYVTableView.h"
#import "TYVDataCell.h"
#import "TYVDataArrayModel.h"
#import "TYVDataModel.h"
#import "TYVDataArrayModelInfo.h"
#import "TYVModelMovingPosition.h"
#import "TYVAbstractDataModelProtocol.h"
#import "TYVDispatch.h"
#import "TYVMacro.h"

#import "UINib+TYVExtentions.h"
#import "UITableView+TYVExtentions.h"

TYVViewControllerProperty(TYVTableViewController, tableView, TYVTableView)

@interface TYVTableViewController () <TYVAbstractDataModelProtocol>

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
        [_dataArray removeObserver:self];
        
        _dataArray = dataArray;
        [_dataArray addObserver:self];
        [_dataArray load];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataArray load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onClickAddButton:(id)sender {
    [self.dataArray addModel:[TYVDataModel model]];
}

- (IBAction)onClickEditButton:(id)sender {
    TYVTableView *tableView = self.tableView;
    BOOL editing = tableView.editing;
    [tableView setEditing:!editing animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYVDataCell *cell = [tableView reusableCellWithClass:[TYVDataCell class]];
    
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
#pragma mark TYVAbstractDataModelProtocol

- (void)model:(TYVDataArrayModel *)dataArray didChangeWithObject:(TYVDataArrayModelInfo *)info {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self)
        [self.tableView.tableView updateWithInfo:info];
    });
}

- (void)modelDidLoad:(TYVDataArrayModel *)dataArray {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self)
        TYVTableView *tableView = self.tableView;
        [tableView hideLoadingView];
        [tableView.tableView reloadData];
    });
}

- (void)modelWillLoad:(TYVDataArrayModel *)dataArray {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self)
        [self.tableView showLoadingView];
    });
}


@end
