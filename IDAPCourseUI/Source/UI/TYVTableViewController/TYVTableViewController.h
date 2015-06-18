//
//  TYVTableViewController.h
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVDataModel;

@interface TYVTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)   TYVDataModel *data;

@end
