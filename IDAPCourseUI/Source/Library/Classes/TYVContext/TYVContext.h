//
//  TYVContext.h
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import <Foundation/Foundation.h>

@class TYVAbstractDataModel;

@interface TYVContext : NSObject
@property (nonatomic, strong)   id                          model;
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;

+ (instancetype)contextWithModel:(TYVAbstractDataModel *)model;
- (instancetype)initWithModel:(TYVAbstractDataModel *)model;

- (void)execute;

// This is the method for overriding
// You have to set the state in this method manually
- (void)fillModel:(TYVAbstractDataModel *)model;

- (void)cancel;

@end
