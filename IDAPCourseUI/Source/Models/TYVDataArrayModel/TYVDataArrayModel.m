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
@property (nonatomic, readonly)   NSString    *fileName;
@property (nonatomic, readonly)   NSString    *filePath;

@property (nonatomic, assign, getter=isFileAvailable)    BOOL    fileAvailable;

- (NSMutableArray *)defaultContent;

- (NSMutableArray *)contentFromFile:(NSString *)filePath;

@end

@implementation TYVDataArrayModel

@dynamic fileName;
@dynamic filePath;
@dynamic fileAvailable;

#pragma mark -
#pragma mark Deallocations and Initializations

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super initWithModelsCount:count];
    
    if (self) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(save)
                       name:UIApplicationWillTerminateNotification object:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accsesors

- (NSString *)fileName {
    return kTYVFileName;
}

- (NSString *)filePath {
    return [NSFileManager fileInDocumentsDirectoryWithName:self.fileName];
}

- (BOOL)isFileAvailable {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public Methods

- (void)save {
    @synchronized (self) {
        [NSKeyedArchiver archiveRootObject:self.dataArray toFile:self.filePath];
    }
}

#pragma mark -
#pragma mark Private Methods

- (NSMutableArray *)defaultContent {
    NSMutableArray *modelsArray = [NSMutableArray arrayWithCapacity:TYVArrayCount];
    for (int i = 0; i < TYVArrayCount; i++) {
        [modelsArray addObject:[TYVDataModel model]];
    }
    
    return modelsArray;
}

- (NSMutableArray *)contentFromFile:(NSString *)filePath {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    NSMutableArray *modelsArray = [NSMutableArray array];
    
    modelsArray = (self.fileAvailable) ? [self contentFromFile:self.filePath] : [self defaultContent];
    
    [self performBlockWithoutNotification:^{
        [self addModelsFromArray:modelsArray];
    }];
    
    self.state = TYVModelLoaded;
}

@end
