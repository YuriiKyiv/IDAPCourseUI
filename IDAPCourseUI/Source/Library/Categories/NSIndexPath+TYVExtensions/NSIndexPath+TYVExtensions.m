//
//  NSIndexPath+TYVExtensions.m
//  IDAPCourseUI
//
//  Created by YURII on 24.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSIndexPath+TYVExtensions.h"

@implementation NSIndexPath (TYVExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)pathWithIndex:(NSUInteger)index {
    return [self indexPathForRow:index inSection:0];
}

@end
