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

@interface TYVContext ()

- (void)request;

@end

@implementation TYVContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(TYVAbstractDataModel *)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.connection = nil;
}

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
    }
}

- (id)handler {
    return ^(FBSDKGraphRequestConnection *connection,
                    id result,
                    NSError *error)
    {
        [self parseWithResult:result error:error];
    };
}

- (NSString *)graphPath {
    return nil;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    [self request];
}

- (void)parseWithResult:(id)result error:(NSError *)error {
    
}

- (void)cancel {
    [self.connection cancel];
}

- (void)request {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath parameters:nil];
    self.connection = [request startWithCompletionHandler:self.handler];
}

@end
