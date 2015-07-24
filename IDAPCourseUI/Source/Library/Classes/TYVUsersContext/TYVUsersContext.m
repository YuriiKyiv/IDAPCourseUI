//
//  TYVUsersContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUsersContext.h"
#import "TYVUsersModel.h"

@interface TYVUsersContext ()


@end

@implementation TYVUsersContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    [self fillModel:self.model];
}

- (void)fillModel:(TYVUsersModel *)model {
    model.state = TYVModelWillLoad;
    NSString *path = @"me/friendlists";
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:path parameters:nil];
    
    id handler = ^(FBSDKGraphRequestConnection *connection,
                   id result,
                   NSError *error) {
        NSLog(@"%@", result);
        model.state = TYVModelLoaded;
    };
    
    [request startWithCompletionHandler:handler];
}

@end
