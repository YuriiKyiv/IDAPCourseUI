//
//  TYVDataModel.h
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TYVProtocolObservableObject.h"

typedef NS_ENUM(NSUInteger, TYVImageState) {
    TYVImageUnloaded,
    TYVImageLoading,
    TYVImageLoaded,
    TYVImageFailLoaded
};

@interface TYVDataModel : TYVProtocolObservableObject <NSCoding>
@property (nonatomic, readonly) UIImage     *image;
@property (nonatomic, copy)     NSString    *text;

+ (instancetype)model;

- (instancetype)initWithString:(NSString *)string;

- (void)load;

@end
