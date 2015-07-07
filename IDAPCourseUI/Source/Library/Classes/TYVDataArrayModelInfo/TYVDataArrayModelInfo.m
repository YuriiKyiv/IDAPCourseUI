//
//  TYVDataArrayModelInfo.m
//  IDAPCourseUI
//
//  Created by YURII on 24.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataArrayModelInfo.h"

@interface TYVDataArrayModelInfo ()
@property (nonatomic, assign)   TYVDataArraModelChangeState changeState;
@property (nonatomic, strong)   id                          changing;

@end

@implementation TYVDataArrayModelInfo

#pragma mark -
#pragma mark Class Methods

+ (instancetype)infoWithChangeState:(NSUInteger)state changing:(id)changing {
    return [[self alloc] initWithChangeState:state changing:changing];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithChangeState:(NSUInteger)state changing:(id)changing {
    self = [super init];
    if (self) {
        self.changeState = state;
        self.changing = changing;
    }
    
    return self;
}

@end
