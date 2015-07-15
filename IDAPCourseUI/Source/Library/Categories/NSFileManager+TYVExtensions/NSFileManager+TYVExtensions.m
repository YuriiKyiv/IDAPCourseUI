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

+ (NSString *)documentsDirectory {
    return [self directoryPathWithType:NSDocumentDirectory];
}

+ (NSString *)fileInDocumentsDirectoryWithName:(NSString *)fileName {
    return [[NSFileManager documentsDirectory] stringByAppendingPathComponent:fileName];
}

+ (NSString *)directoryPathWithType:(NSSearchPathDirectory)searchPath {
    return [NSSearchPathForDirectoriesInDomains(searchPath, NSUserDomainMask, YES) objectAtIndex:0];
}

@end
