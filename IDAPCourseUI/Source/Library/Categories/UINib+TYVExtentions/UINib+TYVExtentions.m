//
//  UINib+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UINib+TYVExtentions.h"
#import "NSArray+TYVExtentions.h"

@implementation UINib (TYVExtentions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [[self nibWithClass:cls] objectWithClass:cls];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner {
    return [[self nibWithClass:cls] objectWithClass:cls owner:owner];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner options:(id)options {
    return [[self nibWithClass:cls] objectWithClass:cls owner:owner options:options];
}

+ (id)objectWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [[UINib nibWithClass:cls bundle:bundle] objectWithClass:cls];
}

#pragma mark -
#pragma mark Public Methods

- (id)objectWithClass:(Class)cls {
    return [[self instantiate] objectWithBlock:[UINib objectWithClassBlock:cls]];
}

- (id)objectWithClass:(Class)cls owner:(id)owner {
    return [[self instantiateWithOwner:owner]
            objectWithBlock:[UINib objectWithClassBlock:cls]];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    return [[self instantiateWithOwner:owner options:options] objectWithBlock:[UINib objectWithClassBlock:cls]];
}

- (NSArray *)instantiate {
    return [self instantiateWithOwner:nil];
}

- (NSArray *)instantiateWithOwner:(id)ownerOrNil {
    return [self instantiateWithOwner:nil options:nil];
}

@end
