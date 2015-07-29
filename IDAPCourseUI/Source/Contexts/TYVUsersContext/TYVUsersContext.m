//
//  TYVUsersContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUsersContext.h"
#import "TYVModelArray.h"
#import "TYVUserModel.h"
#import "TYVFacebookConstants.h"

@interface TYVUsersContext ()

@end

@implementation TYVUsersContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return kTYVFriendsGraphPath;
}

#pragma mark -
#pragma mark Public Methods

- (void)parseWithResult:(id)result error:(NSError *)error {
    NSArray *data = result[kTYVDataKey];
    TYVUserModel *userModel = self.model;
    TYVModelArray *usersModel = [TYVModelArray dataWithModelsCount:[data count]];
    
    for (id friend in data) {
        TYVUserModel *tempUser = [TYVUserModel new];
        tempUser.firstName = friend[kTYVNameKey];
        tempUser.ID = friend[kTYVIDKey];
        [usersModel addModel:tempUser];
    }
    
    userModel.friends = usersModel;
    userModel.state = TYVUserFriendsLoaded;
}

@end
