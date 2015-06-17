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
@property (nonatomic, readonly) UIImageView *image;
@property (nonatomic, readonly) NSString    *string;

+ (instancetype)dataWithUrl:(NSURL *)url;

- (instancetype)initWithUrl:(NSURL *)url;

@end
