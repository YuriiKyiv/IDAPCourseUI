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

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [[self nibWithClass:cls] objectWithClass:cls];
}

+ (id)objectWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [[UINib nibWithClass:cls bundle:bundle] objectWithClass:cls];
}

#pragma mark -
#pragma mark Public Methods

- (id)objectWithClass:(Class)cls {
    return [[self instantiate] objectWithBlock:[UINib objectWithClassBlock:cls]];
}

- (NSArray *)instantiate {
    return [self instantiateWithOwner:nil];
}

- (NSArray *)instantiateWithOwner:(id)ownerOrNil {
    return [self instantiateWithOwner:nil options:nil];
}

@end
