//
//  TYVImageView.m
//  IDAPCourseUI
//
//  Created by YURII on 15.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVImageView.h"
#import "TYVImageModel.h"
#import "TYVDispatch.h"
#import "TYVMacro.h"

@implementation TYVImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.imageModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(TYVImageModel *)imageModel {
    if (imageModel != _imageModel) {
        [_imageModel removeObserver:self];
        
        _imageModel = imageModel;
        [_imageModel addObserver:self];
        
        [self fillWithModel:_imageModel];
        
        [_imageModel load];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TYVImageModel *)model {
    self.imageView.image = model.image;
}

#pragma mark -
#pragma mark TYVAbstractDataModelProtocol

- (void)modelDidLoad:(TYVImageModel *)model {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self);
        [self fillWithModel:model];
        [self hideLoadingView];
    });
}

- (void)modelWillLoad:(TYVImageModel *)model {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self);
        [self showLoadingView];
    });
}

@end
