//
//  NSMutableArray+TYVExtensions.m
//  IDAPCourseUI
//
//  Created by YURII on 23.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "NSMutableArray+TYVExtensions.h"

@implementation NSMutableArray (TYVExtensions)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    id object = [self objectAtIndex:sourceIndex];
    [self removeObjectAtIndex:sourceIndex];
    [self insertObject:object atIndex:destinationIndex];
}

@end
