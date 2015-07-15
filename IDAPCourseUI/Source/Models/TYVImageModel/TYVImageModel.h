//
//  TYVImageModel.h
//  IDAPCourseUI
//
//  Created by YURII on 13.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractDataModel.h"

typedef NS_ENUM(NSUInteger, TYVImageModelState) {
    TYVImageModelUnloaded,
    TYVImageModelWillLoad,
    TYVImageModelLoaded,
    TYVImageModelFailedLoading
};

@interface TYVImageModel : TYVAbstractDataModel
@property (nonatomic, readonly) UIImage *image;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)cancelLoading;

@end
