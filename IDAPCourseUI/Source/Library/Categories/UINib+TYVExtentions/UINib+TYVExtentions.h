//
//  UINib+TYVExtentions.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (TYVExtentions)

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)cls bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls owner:(id)owner;
+ (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)owner;
- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

- (NSArray *)instantiate;
- (NSArray *)instantiateWithOwner:(id)ownerOrNil;

@end
