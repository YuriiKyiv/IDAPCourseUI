//
//  TYVDataArrayModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModel.h"
#import "TYVDataModel.h"
#import "TYVDataArrayModelInfo.h"
#import "TYVDispatch.h"
#import "TYVMacro.h"

#import "NSFileManager+TYVExtensions.h"

static NSUInteger const  TYVArrayCount  = 10;

static NSString * const  kTYVFileName   = @"info.plist";

static char * const  kTYVQueue   = "info.plist";

@interface TYVDataArrayModel ()
@property (nonatomic, readonly)   NSString    *fileName;
@property (nonatomic, readonly)   NSString    *filePath;

@property (nonatomic, assign, getter=isFileAvailable)    BOOL    fileAvailable;

- (NSMutableArray *)defaultContent;

- (NSMutableArray *)contentFromFile:(NSString *)filePath;

- (NSArray *)notifications;
- (void)subscribeToNotifications;
- (void)unsubscribeToNotifications;
- (void)subscribeToNotification:(NSString *)notification;
- (void)unsubscribeToNotification:(NSString *)notification;

@end

@implementation TYVDataArrayModel

@dynamic fileName;
@dynamic filePath;
@dynamic fileAvailable;

#pragma mark -
#pragma mark Deallocations and Initializations

- (void)dealloc {
    [self unsubscribeToNotifications];
    [self removeObserver:self];
}

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super initWithModelsCount:count];
    
    if (self) {
        [self addObserver:self];
        [self subscribeToNotifications];
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
    [NSKeyedArchiver archiveRootObject:self.dataArray toFile:self.filePath];
}

- (void)saveForNotifications {
    [self save];
}

#pragma mark -
#pragma mark Private Methods

- (NSArray *)notifications {
    return @[UIApplicationWillTerminateNotification,
             UIApplicationWillTerminateNotification];
}

- (void)subscribeToNotifications {
    NSArray *notifications = [self notifications];
    for (NSString *notification in notifications) {
        [self subscribeToNotification:notification];
    }
}

- (void)subscribeToNotification:(NSString *)notification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(saveForNotifications)
                   name:notification
                 object:nil];
}

- (void)unsubscribeToNotification:(NSString *)notification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self
                      name:notification
                    object:nil];
}

- (void)unsubscribeToNotifications {
    NSArray *notifications = [self notifications];
    for (NSString *notification in notifications) {
        [self unsubscribeToNotification:notification];
    }
}

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

- (void)model:(TYVDataArrayModel *)model didChangeWithObject:(TYVDataArrayModelInfo *)info {
    [self save];
}

@end
