//
//  TYVImageModel.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYVImageModel : NSObject

+ (instancetype)imageWithUrl:(NSURL *)url;
- (instancetype)initWithUrl:(NSURL *)url;

- (void)load;

@end
