//
//  TYVModelMovingPosition.m
//  IDAPCourseUI
//
//  Created by YURII on 25.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVModelMovingPosition.h"

@interface TYVModelMovingPosition ()
@property (nonatomic, strong) NSIndexPath *sourcePath;
@property (nonatomic, strong) NSIndexPath *destinationPath;

@end

@implementation TYVModelMovingPosition

#pragma mark -
#pragma mark Class Methods

+ (instancetype)movingAtSourcePath:(NSIndexPath *)sourcePath
                 toDestinationPath:(NSIndexPath *)destinationPath
{
    return [[self alloc] initWithSourcePath:sourcePath toDestinationPath:destinationPath];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSourcePath:(NSIndexPath *)sourcePath
                 toDestinationPath:(NSIndexPath *)destinationPath
{
    self = [super init];
    if (self) {
        self.sourcePath = sourcePath;
        self.destinationPath = destinationPath;
    }
    
    return self;
}

@end
