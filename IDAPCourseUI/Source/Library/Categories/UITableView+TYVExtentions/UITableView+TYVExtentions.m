//
//  UITableView+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UITableView+TYVExtentions.h"
#import "TYVDataArrayModelInfo.h"
#import "TYVModelMovingPosition.h"
#import "UINib+TYVExtentions.h"

@implementation UITableView (TYVExtentions)

#pragma mark -
#pragma mark Public Methods

- (id)dequeueReusableCellWithClass:(Class)cls {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
}

- (id)reusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithClass:cls];
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

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
