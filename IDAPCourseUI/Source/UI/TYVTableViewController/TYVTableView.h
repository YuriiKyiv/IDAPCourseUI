//
//  TYVTableView.h
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYVLoadingViewHolder.h"

@interface TYVTableView : TYVLoadingViewHolder
@property (nonatomic, strong)  IBOutlet UITableView     *tableView;
@property (nonatomic, strong)  IBOutlet UIButton        *addButton;
@property (nonatomic, strong)  IBOutlet UIButton        *editButton;

@property (nonatomic, getter=isEditing) BOOL    editing;

- (void)setEditing:(BOOL)editing animated:(BOOL)animate;

@end
