//
//  TYVTableViewCell.m
//  IDAPCourseUI
//
//  Created by YURII on 18.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVTableViewCell.h"

@implementation TYVTableViewCell

#pragma mark -
#pragma mark Accessors

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
