//
//  TYVUserModel.m
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUserModel.h"
#import "TYVImageModel.h"
#import "TYVUserModelDelegate.h"

@implementation TYVUserModel

@dynamic imageModel;

#pragma mark -
#pragma mark Accesors

- (TYVImageModel *)imageModel {
    NSURL *path = self.imagePath;
    return path ? [TYVImageModel imageWithURL:path] : nil;
}

#pragma mark -
#pragma mark Public Methods

- (void)zeroModel {
    self.ID = nil;
    self.firstName = nil;
    self.lastName = nil;
    self.friends = nil;
    self.imagePath = nil;
    
    self.state = TYVModelUnloaded;
}

#pragma mark -
#pragma mark ObserverObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TYVUserIDLoaded:
            return @selector(userIDDidLoad:);
            
        case TYVUserFriendsLoaded:
            return @selector(userFriendsDidLoad:);

        case TYVUserDetailLoaded:
            return @selector(userDetailsDidLoad:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
