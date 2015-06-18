//
//  TYVDataModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataModel.h"

@interface TYVDataModel ()
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
    return [self initWithString:@"test" url:url];
}

- (instancetype)initWithString:(NSString *)string url:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

@end
