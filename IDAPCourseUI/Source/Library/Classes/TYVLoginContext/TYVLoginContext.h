//
//  TYVLoginContext.h
//  IDAPCourseUI
//
//  Created by YURII on 21.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVContext.h"

@class TYVUserModel;

@interface TYVLoginContext : TYVContext
@property (nonatomic, strong)   FBSDKLoginManager   *login;
@property (nonatomic, strong)   id                  result;
@property (nonatomic, strong)   TYVUserModel        *model;;

@end
