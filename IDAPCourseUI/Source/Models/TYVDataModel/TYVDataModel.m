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
@property (nonatomic, strong) UIImage     *image;
@property (nonatomic, strong) NSString    *string;

@property (nonatomic, strong)   NSURL   *url;

@end

@implementation TYVDataModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)randomStringWithUrl:(NSURL *)url {
    return [[self alloc] initWithRandomStringAndUrl:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRandomStringAndUrl:(NSURL *)url {
    return [self initWithString:[NSString randomString] url:url];
}

- (instancetype)initWithString:(NSString *)string url:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
        self.string = string;
        [self load];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private Methods

- (void)load {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"jpeg"];
    self.image = [UIImage imageWithContentsOfFile:path];
}

@end
