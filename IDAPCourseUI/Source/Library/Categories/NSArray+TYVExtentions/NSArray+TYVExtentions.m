//
//  NSArray+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "NSArray+TYVExtentions.h"

@implementation NSArray (TYVExtentions)

#pragma mark -
#pragma mark Public Methods

- (id)objectWithBlock:(TYVFindObjectBlock)block {
    for (id object in self) {
        if (block(object)) {
            return object;
        }
    }
    
    return nil;
}

@end
