//
//  TYVUserContext.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVUserContext.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "TYVUserModel.h"

static CGSize   TYVImageSize =  {100, 100};

@interface TYVUserContext ()
@property (nonatomic, strong)   TYVUserModel    *model;

@end

@implementation TYVUserContext

#pragma mark -
#pragma mark Class Methods

+ (TYVUserContext *)userContextWithModel:(TYVUserModel *)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)initWithModel:(TYVUserModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

- (void)execute {
    [self fillModel:self.model];
}

- (void)fillModel:(TYVUserModel *)model {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (token) {
        TYVUserModel *model = self.model;
        FBSDKProfile *profile = [FBSDKProfile currentProfile];
        model.ID = profile.userID;
        model.firstName = profile.firstName;
        model.lastName = profile.lastName;
        model.imagePath = [profile imagePathForPictureMode:FBSDKProfilePictureModeSquare
                                                      size:TYVImageSize];
        
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me/friendlists"
                                                                       parameters:nil
                                                                       HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                NSLog(@"result = %@", result);
            }
        }];
    }
}

@end
