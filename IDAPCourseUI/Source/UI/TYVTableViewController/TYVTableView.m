//
//  TYVTableView.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableView.h"

#import "UINib+TYVExtentions.h"

static const NSTimeInterval TYVDuration =   1.0;
static const CGFloat        TYVAlpha    =   0.5;

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
    [self setEditing:NO animated:NO];
    UINib *nib = [UINib nibWithNibName:@"TYVSpinerView" bundle:nil];
    id object = [nib objectWithClass:[UIView class]];
    [self addSubview:object];
    self.spinerView = object;
}

#pragma mark -
#pragma mark Public Methods

- (void)showSpiner {
    [UIView animateWithDuration:TYVDuration animations:^{
        self.spinerView.alpha = TYVAlpha;
    }];
}

- (void)hideSpiner {
    [UIView animateWithDuration:TYVDuration animations:^{
        self.spinerView.alpha = CGFLOAT_MIN;
    }];
    
}

@end
