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
//        self.connection = [[FBSDKGraphRequestConnection alloc] init];
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
    TYVAbstractDataModel *model = self.model;
    TYVAbstractDataModelState state = model.state;
    if (TYVModelUnloaded == state || TYVModelFailedLoading == state) {
        if ([FBSDKAccessToken currentAccessToken]) {
            model.state = TYVModelWillLoad;
            
            TYVWeakify(self);
            TYVDispatchAsyncOnDefaultQueueWithBlock(^{
                TYVStrongifyAndReturnIfNil(self);
                [self fillModel:model];
            });
        } else {
            model.state = TYVModelFailedLoading;
        }
    } else {
        [model notify];
    }
}

- (void)fillModel:(TYVAbstractDataModel *)model {
    
}

- (void)cancel {
    TYVAbstractDataModel *model = self.model;
    if (TYVModelLoaded != model.state) {
        self.connection = nil;
        model.state  = TYVModelUnloaded;
    }
}

@end
