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
    return NSClassFromString([NSStringFromClass([self class]) stringByAppendingString:@"Context"]);
}

- (void)setModel:(TYVUserModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
        
        self.context = [self.contextClassName contextWithModel:_model];
    }
}

- (void)setContext:(TYVContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [_context execute];
    }
}

@end
