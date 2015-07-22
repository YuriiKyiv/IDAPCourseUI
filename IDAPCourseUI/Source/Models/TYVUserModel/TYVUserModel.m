//
//  TYVUserModel.m
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUserModel.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "TYVImageModel.h"

static CGSize   TYVImageSize =  {100, 100};

@implementation TYVUserModel

@dynamic imageModel;

#pragma mark -
#pragma mark Accesors

- (TYVImageModel *)imageModel {
    return [TYVImageModel imageWithURL:[NSURL URLWithString:self.imagePath]];
}

@end
