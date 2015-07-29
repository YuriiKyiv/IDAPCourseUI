//
//  TYVLoadingLoginContext.m
//  IDAPCourseUI
//
//  Created by YURII on 29.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingLoginContext.h"
#import "TYVUserModel.h"

@implementation TYVLoadingLoginContext

#pragma mark -
#pragma mark Public Methods

- (void)request {
    TYVUserModel *model = self.model;
    model.ID = [FBSDKAccessToken currentAccessToken].userID;
    model.state = TYVUserIDLoaded;
}

@end
