//
//  TYVImageModel.m
//  IDAPCourseUI
//
//  Created by YURII on 13.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVImageModel.h"

@interface TYVImageModel ()
@property (nonatomic, strong)   NSURL   *url;

@end

@implementation TYVImageModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)load {
    
}

#pragma mark -
#pragma mark ObserverObject

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

@end
