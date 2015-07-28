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

typedef NS_ENUM(NSUInteger, TYVContextState) {
    TYVContextStateCount
};

@class TYVAbstractDataModel;

@interface TYVContext : NSObject
@property (nonatomic, strong)   id                          model;
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;
@property (nonatomic, strong)   NSError                     *error;

//You should overrinde this property
@property (nonatomic, readonly)   NSString    *graphPath;
@property (nonatomic, readonly)   id          handler;

+ (instancetype)contextWithModel:(TYVAbstractDataModel *)model;
- (instancetype)initWithModel:(TYVAbstractDataModel *)model;

- (void)execute;

- (void)cancel;

//You should overrinde this method
- (void)parseWithResult:(id)result error:(NSError *)error;

//You should overrinde this method
- (void)request;

@end
