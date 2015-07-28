//
//  TYVUserContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUserContext.h"
#import "TYVUserModel.h"

@interface TYVUserContext ()

@end

@implementation TYVUserContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return [((TYVUserModel *)self.model).ID stringByAppendingString:@"?fields=id,first_name,last_name,picture"];
}

#pragma mark -
#pragma mark Public Methods

- (void)parseWithResult:(id)result error:(NSError *)error {
    TYVUserModel *model = (TYVUserModel *)self.model;
    model.firstName = result[@"first_name"];
    model.firstName = result[@"last_name"];
    model.imagePath = result[@"picture"][@"data"][@"url"];
    
    model.state = TYVUserDetailLoaded;
}

@end
