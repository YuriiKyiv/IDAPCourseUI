//
//  TYVDataArrayModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModel.h"
#import "TYVDataModel.h"

#import "TYVModelArray+TYVPrivate.h"
#import "NSFileManager+TYVExtensions.h"

static NSUInteger const  TYVArrayCount  = 10;

static NSString * const  kTYVFileName   = @"info.plist";

@implementation TYVDataArrayModel

- (void)save {
    @synchronized (self) {
        NSString *filePath = [[NSFileManager usersDocumentDirectory]
                              stringByAppendingFormat:@"/%@", kTYVFileName];
        
        [NSKeyedArchiver archiveRootObject:self.mutableDataArray toFile:filePath];
    }
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    sleep(3);
    NSString *filePath = [[NSFileManager usersDocumentDirectory]
                          stringByAppendingFormat:@"/%@", kTYVFileName];
    
    NSMutableArray *modelsArray = [NSMutableArray array];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        modelsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    } else {
        for (int i = 0; i < TYVArrayCount; i++) {
            [modelsArray addObject:[TYVDataModel model]];
        }
    }
    
    self.mutableDataArray = modelsArray;
    
    self.state = TYVModelLoaded;
}

@end
