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

+ (void)createDirectoryAtFilePath:(NSString *)filePath {
    [[NSFileManager defaultManager] createDirectoryAtPath:[filePath stringByDeletingLastPathComponent]
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:nil];
}

@end
