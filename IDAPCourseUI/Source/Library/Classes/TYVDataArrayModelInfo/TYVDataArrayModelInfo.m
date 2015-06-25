//
//  TYVDataArrayModelInfo.m
//  IDAPCourseUI
//
//  Created by YURII on 24.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModelInfo.h"
#import "TYVModelMovingPosition.h"

@implementation TYVDataArrayModelInfo

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.insertIndexes = [NSMutableArray array];
        self.deleteIndexes = [NSMutableArray array];
        self.movePosition = [TYVModelMovingPosition  new];
    }
    
    return self;
}

@end
