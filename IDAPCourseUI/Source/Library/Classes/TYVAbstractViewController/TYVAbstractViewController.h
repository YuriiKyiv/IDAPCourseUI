//
//  TYVAbstractViewController.h
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVUserModel;
@class TYVContext;

@interface TYVAbstractViewController : UIViewController
// You should override this property
@property (nonatomic, readonly) Class         contextClassName;
@property (nonatomic, strong)   TYVUserModel  *model;
@property (nonatomic, strong)   TYVContext    *context;

@end
