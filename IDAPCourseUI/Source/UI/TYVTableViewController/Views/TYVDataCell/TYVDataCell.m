//
//  TYVDataCell.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataCell.h"
#import "TYVDataModel.h"
#import "TYVDispatch.h"
#import "TYVMacro.h"
#import "TYVImageView.h"

@implementation TYVDataCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.data = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setData:(TYVDataModel *)data {
    if (_data != data) {
        [_data removeObserver:self];
        
        _data = data;
        [_data addObserver:self];
        self.pictureView.imageModel = _data.imageModel;

        [self fillWithModel:_data];
        
        [data load];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TYVDataModel *)model {
    self.dataLabel.text = model.text;
}

#pragma mark -
#pragma mark TYVAbstractDataModelProtocol

- (void)modelDidLoad:(TYVDataModel *)dataModel {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self);
        [self fillWithModel:dataModel];
    });
}

- (void)modelWillLoad:(TYVDataModel *)dataModel {
    TYVWeakify(self);
    TYVDispatchAsyncOnMainQueueWithBlock(^{
        TYVStrongifyAndReturnIfNil(self);
    });
}

@end
