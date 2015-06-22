//
//  NSBundle+TYVExtensions.m
//  IDAPCourseUI
//
//  Created by YURII on 22.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "NSBundle+TYVExtensions.h"
#import "UINib+TYVExtentions.h"

@implementation NSBundle (TYVExtensions)

#pragma mark -
#pragma mark Class Methods

+ (id)objectWithClass:(Class)cls {
    return [[self alloc] objectWithClass:cls];
}

#pragma mark -
#pragma mark Public Methods

- (id)objectWithClass:(Class)cls {
    return [UINib objectWithClass:cls bundle:self];
}

@end
