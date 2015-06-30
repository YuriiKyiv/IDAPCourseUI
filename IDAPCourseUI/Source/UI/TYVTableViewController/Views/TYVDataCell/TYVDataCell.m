//
//  TYVDataCell.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataCell.h"
#import "TYVDataModel.h"

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
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TYVDataModel *)model {
    self.dataLabel.text = model.text;
    if (model.state == TYVImageUnLoaded) {
        [self.spinerView startAnimating];
    } else {
        self.pictureView.image = model.image;
    }
}

#pragma mark -
#pragma mark ImageProtocol

- (void)dataModelDidLoadImage:(TYVDataModel *)dataModel {
    [self.spinerView stopAnimating];
    [self fillWithModel:self.data];
}

@end
