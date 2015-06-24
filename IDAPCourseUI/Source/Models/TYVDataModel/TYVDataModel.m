//
//  TYVDataModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataModel.h"

#import "NSString+TYVExtensions.h"

@interface TYVDataModel ()

@end

@implementation TYVDataModel

@dynamic image;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    return [[self alloc] initWithString:[NSString randomString]];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.text = string;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"jpeg"];
    return [UIImage imageWithContentsOfFile:path];
}

@end
