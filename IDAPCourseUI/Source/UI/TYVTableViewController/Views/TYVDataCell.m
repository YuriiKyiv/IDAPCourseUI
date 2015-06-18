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
#pragma mark Accessors

- (void)setData:(TYVDataModel *)data {
    if (_data != data) {
        _data = data;
        
        [self fillWithModel:_data];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TYVDataModel *)model {
    self.stringLabel.text = model.string;
    self.image.image = model.image;
}

@end
