//
//  UITableView+TYVExtensions.m
//  IDAPCourseUI
//
//  Created by YURII on 29.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UITableView+TYVExtensions.h"
#import "TYVDataArrayModelInfo.h"
#import "TYVModelMovingPosition.h"

@implementation UITableView (TYVExtensions)

- (void)updateWithInfo:(TYVDataArrayModelInfo *)info {
    UITableView *tableView = self;
    
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:info.insertIndexes
                     withRowAnimation:UITableViewRowAnimationLeft];
    [tableView deleteRowsAtIndexPaths:info.deleteIndexes
                     withRowAnimation:UITableViewRowAnimationRight];
    [tableView moveRowAtIndexPath:info.movePosition.sourcePath
                      toIndexPath:info.movePosition.destinationPath];
    [tableView endUpdates];
}

@end
