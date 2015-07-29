//
//  TYVUserContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUserContext.h"
#import "TYVUserModel.h"
#import "TYVFacebookConstants.h"

@interface TYVUserContext ()

@end

@implementation TYVUserContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TYVUserModel *model = self.model;
    return [model.ID stringByAppendingString:kTYVUserRequest];
}

#pragma mark -
#pragma mark Public Methods

- (void)parseWithResult:(id)result error:(NSError *)error {
    TYVUserModel *model = self.model;
    model.firstName = result[kTYVFirstName];
    model.firstName = result[kTYVLastName];
    model.imagePath = result[kTYVPicture][kTYVDataKey][kTYVUrl];
    
    model.state = TYVUserDetailLoaded;
}

@end
