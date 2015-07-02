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
        [self fillWithModel:_data];
        [data load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TYVDataModel *)model {
    TYVDispatchSyncOnMainQueueWithBlock(^{
        self.dataLabel.text = model.text;
        self.pictureView.image = self.data.image;
    });
}

#pragma mark -
#pragma mark ImageProtocol

- (void)dataModelDidLoadImage:(TYVDataModel *)dataModel {
    TYVDispatchSyncOnMainQueueWithBlock(^{
        [self.spinnerView stopAnimating];
        [self fillWithModel:dataModel];
    });
}

- (void)dataModelLoadingImage:(TYVDataModel *)dataModel {
    TYVDispatchSyncOnMainQueueWithBlock(^{
        [self.spinnerView startAnimating];
    });
}

@end
