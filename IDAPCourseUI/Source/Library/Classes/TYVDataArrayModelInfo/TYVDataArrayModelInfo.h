//
//  TYVDataArrayModelInfo.h
//  IDAPCourseUI
//
//  Created by YURII on 24.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYVDataArrayModelInfo : NSObject
@property (nonatomic, strong)   NSMutableArray  *insertIndexes;
@property (nonatomic, strong)   NSMutableArray  *deleteIndexes;
@property (nonatomic, strong)   NSMutableArray  *moveIndexes;

@end