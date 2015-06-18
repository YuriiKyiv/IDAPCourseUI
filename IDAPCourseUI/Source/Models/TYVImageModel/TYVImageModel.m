//
//  TYVImageModel.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVImageModel.h"
#import <UIKit/UIKit.h>

@interface TYVImageModel ()
@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, strong)   NSURL   *url;

@end

@implementation TYVImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    return [[self alloc] initWithUrl:url];
}

#pragma mark -
#pragma mark Initialization and Deallocations

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

- (void)load {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"jpeg"];
    self.image = [UIImage imageWithContentsOfFile:path];
}


@end
