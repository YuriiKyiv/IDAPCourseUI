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
    @synchronized(self) {
        __block id object = nil;
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger index,BOOL *stop) {
            object = obj;
            if (block(object)) {
                *stop = YES;
            } else {
                object = nil;
            }
        }];
        
        return object;
    }
}

@end
