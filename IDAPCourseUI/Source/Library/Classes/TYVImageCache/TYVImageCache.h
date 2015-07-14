//
//  TYVImageCache.h
//  IDAPCourseUI
//
//  Created by YURII on 13.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYVImageCache : NSObject

+ (instancetype)sharedImageCache;

- (void)addObject:(id)object forKey:(id)key;
- (id)objectForKey:(id)key;

- (BOOL)containsObjectForKey:(id)key;

@end
