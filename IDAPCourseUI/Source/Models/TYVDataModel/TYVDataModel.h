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
@property (nonatomic, readonly) NSString    *string;

+ (instancetype)randomStringWithUrl:(NSURL *)url;

- (instancetype)initWithRandomStringAndUrl:(NSURL *)url;

- (instancetype)initWithString:(NSString *)string url:(NSURL *)url NS_DESIGNATED_INITIALIZER;

@end
