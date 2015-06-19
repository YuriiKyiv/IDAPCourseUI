//
//  UITableView+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UITableView+TYVExtentions.h"
#import "UINib+TYVExtentions.h"

@implementation UITableView (TYVExtentions)

#pragma mark -
#pragma mark Public Methods

- (TYVTableViewCell *)dequeueReusableCellWithClass:(Class)class {
    TYVTableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

@end
