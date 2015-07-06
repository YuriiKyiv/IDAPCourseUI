//
//  TYVDataCell.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableViewCell.h"
#import "TYVAbstractDataModelProtocol.h"

@class TYVDataModel;

@interface TYVDataCell : TYVTableViewCell <TYVAbstractDataModelProtocol>
@property (nonatomic, strong)   IBOutlet UILabel        *dataLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *pictureView;

@property (nonatomic ,strong)   IBOutlet UIActivityIndicatorView    *spinnerView;

@property (nonatomic, strong)   TYVDataModel    *data;

- (void)fillWithModel:(TYVDataModel *)model;

@end
