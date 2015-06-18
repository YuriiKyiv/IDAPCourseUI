//
//  UINib+TYVExtentions.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (TYVExtentions)

+ (UINib *)nibWithClass:(Class)class;
+ (UINib *)nibWithClass:(Class)class boundle:(NSBundle *)boundle;

+ (UIView *)viewWithClass:(Class)class;

- (NSArray *)instantiate;

@end
