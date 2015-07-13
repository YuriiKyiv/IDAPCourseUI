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
    
    switch (info.changeState) {
        case TYVDataArrayModelInsert:
            [tableView insertRowsAtIndexPaths:@[info.changing]
                             withRowAnimation:UITableViewRowAnimationLeft];
            break;
            
        case TYVDataArrayModelDelete:
            [tableView deleteRowsAtIndexPaths:@[info.changing]
                             withRowAnimation:UITableViewRowAnimationRight];
            break;
            
        case TYVDataArrayModelMove:
            [tableView moveWithModelMovingPosition:info.changing];
            break;
            
        default:
            break;
    }
    
    
    
    [tableView endUpdates];
}

- (void)moveWithModelMovingPosition:(TYVModelMovingPosition *)position; {
    [self moveRowAtIndexPath:position.sourcePath
                      toIndexPath:position.destinationPath];
}

@end
