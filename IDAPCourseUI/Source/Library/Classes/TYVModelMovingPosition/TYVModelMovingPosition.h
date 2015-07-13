//
//  TYVModelMovingPosition.h
//  IDAPCourseUI
//
//  Created by YURII on 25.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYVModelMovingPosition : NSObject
@property (nonatomic, readonly) NSIndexPath *sourcePath;
@property (nonatomic, readonly) NSIndexPath *destinationPath;

+ (instancetype)movingAtSourceIndexPath:(NSIndexPath *)sourcePath
                        destinationIndexPath:(NSIndexPath *)destinationPath;

+ (instancetype)movingAtIndex:(NSUInteger)sourceIndex
             destinationIndex:(NSUInteger)destinationIndex;

- (instancetype)initWithIndexPath:(NSIndexPath *)sourcePath
                  destinationIndexPath:(NSIndexPath *)destinationPath NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithIndex:(NSUInteger)sourceIndex
             destinationIndex:(NSUInteger)destinationIndex;

@end
