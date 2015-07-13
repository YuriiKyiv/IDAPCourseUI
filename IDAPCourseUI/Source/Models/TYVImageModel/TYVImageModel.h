//
//  TYVImageModel.h
//  IDAPCourseUI
//
//  Created by YURII on 13.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVProtocolObservableObject.h"

typedef NS_ENUM(NSUInteger, TYVImageModelState) {
    TYVImageModelUnloaded,
    TYVImageModelWillLoad,
    TYVImageModelLoaded,
    TYVImageModelFailedLoading
};

@interface TYVImageModel : TYVProtocolObservableObject

- (instancetype)initWithURL:(NSURL *)url;

- (void)load;

@end
