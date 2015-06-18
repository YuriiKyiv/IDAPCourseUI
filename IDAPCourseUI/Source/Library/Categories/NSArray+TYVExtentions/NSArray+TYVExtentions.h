//
//  NSArray+TYVExtentions.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^TYVFindObjectBlock)(id);

@interface NSArray (TYVExtentions)

- (id)objectWithBlock:(TYVFindObjectBlock)block;

@end
