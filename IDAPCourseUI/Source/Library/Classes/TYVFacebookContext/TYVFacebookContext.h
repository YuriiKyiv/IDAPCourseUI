//
//  TYVFacebookContext.h
//  IDAPCourseUI
//
//  Created by YURII on 27.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVContext.h"

@interface TYVFacebookContext : TYVContext
// This property for overriding
@property (nonatomic, readonly)   NSString    *graphPath;
@property (nonatomic, readonly)   id          handler;

- (void)parseResult:(id)result;

@end
