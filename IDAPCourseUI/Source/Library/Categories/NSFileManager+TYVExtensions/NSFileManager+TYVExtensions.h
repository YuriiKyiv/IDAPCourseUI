//
//  NSFileManager+TYVExtensions.h
//  IDAPCourseUI
//
//  Created by YURII on 02.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (TYVExtensions)

+ (NSString *)documentsDirectory;

+ (NSString *)fileInDocumentsDirectoryWithName:(NSString *)fileName;

+ (NSString *)directoryPathWithType:(NSSearchPathDirectory)searchPath;

+ (void)createDirectoryAtFilePath:(NSString *)filePath;

@end
