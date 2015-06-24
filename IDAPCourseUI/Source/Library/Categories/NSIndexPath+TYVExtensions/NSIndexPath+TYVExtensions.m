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

+ (instancetype)pathWithArray:(NSArray *)array {
    return [self indexPathForRow:array[0] inSection:array[1]];
}

@end
