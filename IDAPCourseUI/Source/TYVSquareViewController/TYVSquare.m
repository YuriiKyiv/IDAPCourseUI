//
//  TYVSquare.m
//  IDAPCourseUI
//
//  Created by YURII on 16.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVSquare.h"

@implementation TYVSquare

#pragma mark -
#pragma Initializations and Deallocations

- (instancetype)initWithSquarePosition:(TYVSquarePositionType)position {
    self = [super init];
    if (self) {
        self.position = position;
    }
    
    return self;
}

@end
