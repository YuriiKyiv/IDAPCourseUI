//
//  TYVImageView.h
//  IDAPCourseUI
//
//  Created by YURII on 15.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYVLoadingViewHolder.h"

@class TYVImageModel;

@interface TYVImageView : TYVLoadingViewHolder
@property (nonatomic, strong)   IBOutlet    UIImageView *imageView;

@property (nonatomic, strong)   TYVImageModel   *imageModel;

- (void)fillWithModel:(TYVImageModel *)imageModel;

@end
