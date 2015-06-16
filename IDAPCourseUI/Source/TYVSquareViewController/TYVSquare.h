//
//  TYVSquare.h
//  IDAPCourseUI
//
//  Created by YURII on 16.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TYVSquareView.h"

@interface TYVSquare : NSObject
@property  (nonatomic, assign)  TYVSquarePositionType  position;

- (instancetype)initWithSquarePosition:(TYVSquarePositionType)position;

@end
