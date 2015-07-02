//
//  NSFileManager+TYVExtensions.m
//  IDAPCourseUI
//
//  Created by YURII on 02.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "NSFileManager+TYVExtensions.h"

@implementation NSFileManager (TYVExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)directoryForUserDocument {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

@end
