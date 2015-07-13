//
//  TYVImageModel.h
//  IDAPCourseUI
//
//  Created by YURII on 13.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVProtocolObservableObject.h"

@interface TYVImageModel : TYVProtocolObservableObject

- (instancetype)initWithURL:(NSURL *)url;

- (void)load;

@end
