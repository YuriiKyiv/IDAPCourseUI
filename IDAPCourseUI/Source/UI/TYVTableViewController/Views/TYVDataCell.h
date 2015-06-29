//
//  TYVDataCell.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableViewCell.h"
#import "TYVImageProtocol.h"

@class TYVDataModel;

@interface TYVDataCell : TYVTableViewCell <TYVImageProtocol>
@property (nonatomic, strong)   IBOutlet UILabel        *dataLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *imageView;

@property (nonatomic ,strong)   IBOutlet UIActivityIndicatorView    *spinerView;

@property (nonatomic, strong)   TYVDataModel    *data;

- (void)fillWithModel:(TYVDataModel *)model;

@end
