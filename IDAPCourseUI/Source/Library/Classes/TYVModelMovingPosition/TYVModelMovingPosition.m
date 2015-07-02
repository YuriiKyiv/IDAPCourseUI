//
//  TYVModelMovingPosition.m
//  IDAPCourseUI
//
//  Created by YURII on 25.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVModelMovingPosition.h"
#import "NSIndexPath+TYVExtensions.h"

@interface TYVModelMovingPosition ()
@property (nonatomic, strong) NSIndexPath *sourcePath;
@property (nonatomic, strong) NSIndexPath *destinationPath;

@end

@implementation TYVModelMovingPosition

#pragma mark -
#pragma mark Class Methods

+ (instancetype)movingAtSourceIndexPath:(NSIndexPath *)sourcePath
                 destinationIndexPath:(NSIndexPath *)destinationPath
{
    return [[self alloc] initWithIndexPath:sourcePath destinationIndexPath:destinationPath];
}

+ (instancetype)movingAtIndex:(NSUInteger)sourceIndex
             destinationIndex:(NSUInteger)destinationIndex {
    return [[self alloc] initWithIndex:sourceIndex destinationIndex:destinationIndex];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithIndexPath:(NSIndexPath *)sourcePath
                 destinationIndexPath:(NSIndexPath *)destinationPath
{
    self = [super init];
    if (self) {
        self.sourcePath = sourcePath;
        self.destinationPath = destinationPath;
    }
    
    return self;
}

- (instancetype)initWithIndex:(NSUInteger)sourceIndex
             destinationIndex:(NSUInteger)destinationIndex {
    return [self initWithIndexPath:[NSIndexPath pathWithIndex:sourceIndex]
                   destinationIndexPath:[NSIndexPath pathWithIndex:destinationIndex]];
}

- (instancetype)init {
    return [self initWithIndex:NSUIntegerMax destinationIndex:NSUIntegerMax];
}

@end
