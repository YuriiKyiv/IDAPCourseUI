//
//  UITableView+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UITableView+TYVExtentions.h"

@implementation UITableView (TYVExtentions)

#pragma mark -
#pragma mark Public Methods

- (TYVTableViewCell *)dequeueReusableCellWithClass:(Class)class {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
}

@end
