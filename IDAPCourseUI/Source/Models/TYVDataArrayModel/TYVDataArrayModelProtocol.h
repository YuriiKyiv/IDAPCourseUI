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
- (void)dataArray:(TYVDataArrayModel *)dataArray didChangeWithObject:(id)object;

- (void)dataArrayDidLoaded:(TYVDataArrayModel *)dataArray;

- (void)dataArrayWillLoad:(TYVDataArrayModel *)dataArray;

- (void)dataArrayFailLoaded:(TYVDataArrayModel *)dataArray;

@end
