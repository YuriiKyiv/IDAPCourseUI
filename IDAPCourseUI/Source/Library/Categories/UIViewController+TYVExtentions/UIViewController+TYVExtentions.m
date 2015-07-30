//
//  UIViewController+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 30.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UIViewController+TYVExtentions.h"

@implementation UIViewController (TYVExtentions)

+ (instancetype)controller {
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
