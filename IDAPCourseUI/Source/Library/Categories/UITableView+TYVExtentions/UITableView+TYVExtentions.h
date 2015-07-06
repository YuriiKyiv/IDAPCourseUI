//
//  UITableView+TYVExtentions.h
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYVTableViewCell;
@class TYVModelMovingPosition;

@interface UITableView (TYVExtentions)

- (id)dequeueReusableCellWithClass:(Class)cls;

- (id)reusableCellWithClass:(Class)cls;

- (void)updateWithInfo:(id)info;

- (void)moveWithModelMovingPosition:(TYVModelMovingPosition *)position;

@end
