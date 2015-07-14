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
#pragma mark Class Methods

+ (TYVFindObjectBlock)objectWithClassBlock:(Class)class {
    TYVFindObjectBlock result = ^(id object) {
        return ([object isMemberOfClass:class]);
    };
    
    return result;
}

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

- (id)objectWithClass:(Class)cls {
    return [self objectWithBlock:[NSArray objectWithClassBlock:cls]];
}

@end
