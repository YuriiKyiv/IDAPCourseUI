//
//  TYVLoginContext.m
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoginContext.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "TYVUserModel.h"
#import "TYVDispatch.h"
#import "TYVFacebookConstants.h"
#import "TYVMacro.h"

@interface TYVLoginContext ()
@property (nonatomic, strong)   NSArray             *permissions;
@property (nonatomic, strong)   FBSDKLoginManager   *login;
@property (nonatomic, strong)   id                  result;

- (void)makeLogin;

@end

@implementation TYVLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Accessors

- (NSArray *)permissions {
    return @[kTYVPublicProfile, kTYVEmail, kTYVUserFriends];
}

- (id)handler {
    TYVWeakify(self);
   return ^(FBSDKLoginManagerLoginResult *result, NSError *error)
    {
        TYVStrongifyAndReturnIfNil(self);
        self.error = error;
        if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"%@", result);
            self.result = result;
            [self parseWithResult:result error:error];
        }
    };
}

#pragma mark -
#pragma mark Public Methods

- (void)request {
    TYVUserModel *model = self.model;
    if (model.state == TYVUserIDLoaded) {
        return;
    }
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [self parseWithResult:nil error:nil];
    } else {
        [self makeLogin];
    }
}

- (void)parseWithResult:(id)result error:(NSError *)error {
    TYVUserModel *model = self.model;
    model.ID = [FBSDKAccessToken currentAccessToken].userID;
    model.state = TYVUserIDLoaded;
}

#pragma mark -
#pragma mark Private Methods

- (void)makeLogin {
    self.login = [[FBSDKLoginManager alloc] init];
    [self.login logInWithReadPermissions:self.permissions
                                 handler:self.handler];
}

@end
