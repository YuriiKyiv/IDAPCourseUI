//
//  TYVContext.m
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVContext.h"
#import "TYVAbstractDataModel.h"
#import "TYVDispatch.h"
#import "TYVMacro.h"

@implementation TYVContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(TYVAbstractDataModel *)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)initWithModel:(TYVAbstractDataModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setConnection:(FBSDKGraphRequestConnection *)connection {
    if (_connection != connection) {
        [_connection cancel];
        _connection = connection;
        [_connection start];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {

}

- (void)fillModel:(TYVAbstractDataModel *)model {
    
}

- (void)cancel {

}

@end
