//
//  TYVAbstractViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractViewController.h"
#import "TYVUserModel.h"
#import "TYVContext.h"
#import "TYVMacro.h"
#import "TYVContextProtocol.h"

@interface TYVAbstractViewController ()

@end

@implementation TYVAbstractViewController

@dynamic contextClassName;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (Class )contextClassName {
    return nil;
}

- (void)setModel:(TYVUserModel *)model {
    TYVModelSetterSynthesize(model, TYVAddContext);
}

- (void)setContext:(id<TYVContextProtocol>)context {
    TYVContextSetterSynthesize(context);
}

@end
