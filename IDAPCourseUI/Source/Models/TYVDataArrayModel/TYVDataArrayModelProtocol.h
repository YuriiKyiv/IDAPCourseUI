//
//  TYVDataArrayModelProtocol.h
//  IDAPCourseUI
//
//  Created by YURII on 22.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYVDataArrayModel;

@protocol TYVDataArrayModelProtocol <NSObject>

@optional
- (void)dataArrayDidChange:(TYVDataArrayModel *)dataArray;

@end
