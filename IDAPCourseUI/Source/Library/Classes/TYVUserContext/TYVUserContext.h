//
//  TYVUserContext.h
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVContext.h"

@class TYVUserModel;

@interface TYVUserContext : TYVContext

+ (TYVUserContext *)userContextWithModel:(TYVUserModel *)model;
- (instancetype)initWithModel:(TYVUserModel *)model;

- (void)fillModel:(TYVUserModel *)model;

@end
