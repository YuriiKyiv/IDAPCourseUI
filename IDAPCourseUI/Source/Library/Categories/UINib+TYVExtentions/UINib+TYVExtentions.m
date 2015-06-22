//
//  UINib+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UINib+TYVExtentions.h"
#import "NSArray+TYVExtentions.h"

@interface  UINib (__TYVPrivateNib)

+ (TYVFindObjectBlock)objectWithClassBlock:(Class)class;

@end

@implementation UINib (__TYVPrivateNib)

#pragma mark -
#pragma mark Private Class Methods

+ (TYVFindObjectBlock)objectWithClassBlock:(Class)class {
    TYVFindObjectBlock result = ^(UIView *view) {
        return ([view isMemberOfClass:class]);
    };
    
    return result;
}

@end

@implementation UINib (TYVExtentions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)class {
    return [self nibWithClass:class bundle:nil];
}

+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(class) bundle:bundle];
}

+ (id)objectWithClass:(Class)class {
    return [[self nibWithClass:class] objectWithClass:class];
}

#pragma mark -
#pragma mark Public Methods

- (id)objectWithClass:(Class)class {
    return [[self instantiate] objectWithBlock:[UINib objectWithClassBlock:class]];
}

- (NSArray *)instantiate {
    return [self instantiateWithOwner:nil];
}

- (NSArray *)instantiateWithOwner:(id)ownerOrNil {
    return [self instantiateWithOwner:nil options:nil];
}

@end
