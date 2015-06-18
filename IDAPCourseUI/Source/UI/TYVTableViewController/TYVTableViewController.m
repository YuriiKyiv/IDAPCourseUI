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
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *class = NSStringFromClass([TYVDataCell class]);
    
    TYVDataCell *cell = [tableView dequeueReusableCellWithIdentifier:class];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:class bundle:nil];
        NSArray *array = [nib instantiateWithOwner:nil options:nil];
        cell = [array firstObject];
    }
    
    cell.data = self.data;
    
    return cell;
}

@end
