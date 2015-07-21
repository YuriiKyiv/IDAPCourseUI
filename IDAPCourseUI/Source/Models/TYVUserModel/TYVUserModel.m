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

@interface TYVUserModel ()
@property (nonatomic, strong) NSString  *firstName;
@property (nonatomic, strong) NSString  *lastName;

@property (nonatomic, strong) NSString  *imagePath;

@end

@implementation TYVUserModel

@dynamic imageModel;

#pragma mark -
#pragma mark Initializations and Deallocation

- (instancetype)initWithProfile:(FBSDKProfile *)profile {
    self = [super init];
    if (self) {
        self.firstName = profile.firstName;
        self.lastName = profile.lastName;
        self.imagePath = [profile imagePathForPictureMode:FBSDKProfilePictureModeSquare
                                                     size:TYVImageSize];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (TYVImageModel *)imageModel {
    return [TYVImageModel imageWithURL:[NSURL URLWithString:self.imagePath]];
}

@end
