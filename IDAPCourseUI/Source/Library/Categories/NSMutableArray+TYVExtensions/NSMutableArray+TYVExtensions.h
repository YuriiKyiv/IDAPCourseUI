//
//  NSMutableArray+TYVExtensions.h
//  IDAPCourseUI
//
//  Created by YURII on 23.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TYVExtensions)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;

@end
