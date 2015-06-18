//
//  TYVDataCell.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableViewCell.h"

@class TYVDataModel;

@interface TYVDataCell : TYVTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *stringLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *image;

@property (nonatomic, strong)   TYVDataModel    *data;

- (void)fillWithModel:(TYVDataModel *)model;

@end