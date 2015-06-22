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
+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)class bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)class;
- (id)objectWithClass:(Class)class;

- (NSArray *)instantiate;
- (NSArray *)instantiateWithOwner:(id)ownerOrNil;

@end
