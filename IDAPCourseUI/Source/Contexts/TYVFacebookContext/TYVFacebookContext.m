//
//  TYVFacebookContext.m
//  IDAPCourseUI
//
//  Created by YURII on 27.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFacebookContext.h"
#import "TYVAbstractDataModel.h"

@implementation TYVFacebookContext

@dynamic graphPath;
@dynamic handler;

#pragma mark -
#pragma mark Accessors

- (id)handler {
    return ^(FBSDKGraphRequestConnection *connection,
             id result,
             NSError *error)
    {
        [self parseResult:result];
        self.model.state = TYVModelLoaded;
    };
}

- (NSString *)graphPath {
    return nil;
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModel:(TYVAbstractDataModel *)model {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath parameters:nil];
    [request startWithCompletionHandler:self.handler];
}

- (void)parseResult:(id)result {
    
}

@end
