//
//  UIWindow+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UIWindow+TYVExtentions.h"

@implementation UIWindow (TYVExtentions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)window {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
