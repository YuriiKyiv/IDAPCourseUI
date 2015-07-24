//
//  TYVFriendsView.h
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVLoadingViewHolder.h"

@class TYVUserModel;

@interface TYVFriendsView : TYVLoadingViewHolder
@property (nonatomic, strong)  IBOutlet UITableView     *tableView;

@property (nonatomic, strong)   TYVUserModel  *model;

@end
