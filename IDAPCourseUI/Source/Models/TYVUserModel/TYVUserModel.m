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
    return [TYVImageModel imageWithURL:[NSURL URLWithString:self.imagePath]];
}

#pragma mark -
#pragma mark ObserverObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TYVUserModelIDLoaded:
            return @selector(userIDDidLoad:);
            
        case TYVUserModelFriendsLoaded:
            return @selector(userFriendsDidLoad:);
//
//        case TYVModelFailedLoading:
//            return @selector(modelDidFailedLoading:);
//            
//        case TYVModelUnloaded:
//            return @selector(modelDidUnload:);
//            
//        case TYVModelDidChange:
//            return @selector(model:didChangeWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
