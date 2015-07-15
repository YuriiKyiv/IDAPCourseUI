//
//  TYVImageView.h
//  IDAPCourseUI
//
//  Created by YURII on 15.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVImageModel;

@interface TYVImageView : UIView
@property (nonatomic, strong)   IBOutlet    UIImageView *imageView;

@property (nonatomic, strong)   TYVImageModel   *imageModel;

- (void)fillWithModel:(TYVImageModel *)imageModel;

@end
