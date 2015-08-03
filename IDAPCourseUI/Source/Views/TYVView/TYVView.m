//
//  TYVView.m
//  IDAPCourseUI
//
//  Created by YURII on 30.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVView.h"
#import "TYVUserModel.h"
#import "TYVMacro.h"

@implementation TYVView

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TYVUserModel *)model {
    TYVModelSetterSynthesize(model, TYVFillWithModel)
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self showLoadingView];
}


#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TYVUserModel *)model {
    
}

@end
