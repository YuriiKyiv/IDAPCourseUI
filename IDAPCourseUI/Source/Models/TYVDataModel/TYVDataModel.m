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
@dynamic text;

#pragma mark -
#pragma mark Accessors

- (NSString *)text {
    return [NSString randomString];
}

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"jpeg"];
    return [UIImage imageWithContentsOfFile:path];
}

@end
