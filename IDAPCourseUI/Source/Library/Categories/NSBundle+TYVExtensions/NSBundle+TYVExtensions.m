//
//  NSBundle+TYVExtensions.m
//  IDAPCourseUI
//
//  Created by YURII on 22.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSBundle+TYVExtensions.h"

#import "NSArray+TYVExtentions.h"
#import "UINib+TYVExtentions.h"

@implementation NSBundle (TYVExtensions)

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *array = [self loadNibNamed:NSStringFromClass(cls) owner:owner options:options];
    
    return [array objectWithClass:cls];
}

@end
