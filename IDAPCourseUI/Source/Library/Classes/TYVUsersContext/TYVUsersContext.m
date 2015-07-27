//
//  TYVUsersContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUsersContext.h"
#import "TYVUsersModel.h"
#import "TYVUserModel.h"

@interface TYVUsersContext ()


@end

@implementation TYVUsersContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return @"me/friends";
}

#pragma mark -
#pragma mark Public Methods

- (void)parseResult:(id)result {
    NSArray *data = result[@"data"];
    TYVUserModel *userModel = self.model;
    TYVUsersModel *usersModel = userModel.friends;
    
    for (id friend in data) {
        TYVUserModel *tempUser = [TYVUserModel new];
        tempUser.firstName = friend[@"name"];
        [usersModel addModel:tempUser];
    }
}

@end
