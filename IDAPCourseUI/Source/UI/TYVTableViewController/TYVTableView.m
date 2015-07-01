//
//  TYVTableView.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableView.h"
#import "TYVLoadingView.h"

#import "UINib+TYVExtentions.h"

static NSString * const  kTYVButtonTitleDone = @"Done";
static NSString * const  kTYVButtonTitleEdit = @"Edit";

@implementation TYVTableView

@dynamic editing;

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing animated:(BOOL)animate {
    UITableView *tableView = self.tableView;
    
    [tableView setEditing:editing animated:animate];
    [self.editButton setTitle:editing ? kTYVButtonTitleDone : kTYVButtonTitleEdit forState:UIControlStateNormal];
}

- (BOOL)isEditing {
    return self.tableView.editing;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setEditing:NO animated:NO];
    
    id object = [UINib objectWithClass:[TYVLoadingView class]];
    [self addSubview:object];
    self.loadingView = object;
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    [self.loadingView showLoadingView];
}

- (void)hideLoadingView {
    [self.loadingView hideLoadingView];
    
}

@end
