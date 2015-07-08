//
//  TYVDataArrayModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModel.h"
#import "TYVDataModel.h"

#import "NSFileManager+TYVExtensions.h"

static NSUInteger const  TYVArrayCount  = 10;

static NSString * const  kTYVFileName   = @"info.plist";

@interface TYVDataArrayModel ()
@property (nonatomic, strong)   NSString    *fileName;
@property (nonatomic, strong)   NSString    *filePath;

@property (nonatomic, assign, getter=isFileVailable)    BOOL    fileVailable;

@end

@implementation TYVDataArrayModel

- (void)save {
    @synchronized (self) {
        NSString *filePath = [[NSFileManager usersDocumentDirectory]
                              stringByAppendingFormat:@"/%@", kTYVFileName];
        
        [NSKeyedArchiver archiveRootObject:self.dataArray toFile:filePath];
    }
}

#pragma mark -
#pragma mark Accsesors

- (NSString *)fileName {
    return kTYVFileName;
}

- (NSString *)filePath {
    return [[NSFileManager usersDocumentDirectory] stringByAppendingPathComponent:self.fileName];
}

- (BOOL)isFileVailable {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    NSMutableArray *modelsArray = [NSMutableArray array];

    sleep(1);
    
    if (self.fileVailable) {
        modelsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    } else {
        for (int i = 0; i < TYVArrayCount; i++) {
            [modelsArray addObject:[TYVDataModel model]];
        }
    }
    
    [self addModelsFromArray:modelsArray];
    
    self.state = TYVModelLoaded;
}

@end
