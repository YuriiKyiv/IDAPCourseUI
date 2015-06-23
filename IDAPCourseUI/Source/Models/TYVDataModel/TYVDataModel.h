//
//  TYVDataModel.h
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TYVDataModel : NSObject
@property (nonatomic, readonly) UIImage     *image;
@property (nonatomic, copy)     NSString    *text;

+ (instancetype)modelWithRandomString;

- (instancetype)initWithString:(NSString *)string;

@end
