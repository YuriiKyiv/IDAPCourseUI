//
//  UINib+TYVExtentions.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "UINib+TYVExtentions.h"
#import "NSArray+TYVExtentions.h"

@interface  UINib (_TYVPrivateNib)

+ (TYVFindObjectBlock)viewWithClassBlock:(Class)class;

@end

@implementation UINib (TYVExtentions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)class {
    return [self nibWithClass:class boundle:nil];
}

+ (UINib *)nibWithClass:(Class)class boundle:(NSBundle *)boundle {
    return [UINib nibWithNibName:NSStringFromClass(class) bundle:boundle];
}

+ (UIView *)viewWithClass:(Class)class {
    return [[[self nibWithClass:class] instantiate] objectWithBlock:[UINib viewWithClassBlock:class]];
}

#pragma mark -
#pragma mark Public Methods

- (NSArray *)instantiate {
    return [self instantiateWithOwner:nil options:nil];
}

#pragma mark -
#pragma mark Private Class Methods

+ (TYVFindObjectBlock)viewWithClassBlock:(Class)class {
    TYVFindObjectBlock result = ^(UIView *view) {
        return ([view isMemberOfClass:class]);
    };
    
    return result;
}

@end
