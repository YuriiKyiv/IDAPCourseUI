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

+ (instancetype)movingAtSourcePath:(NSIndexPath *)sourcePath
                 toDestinationPath:(NSIndexPath *)destinationPath;

- (instancetype)initWithSourcePath:(NSIndexPath *)sourcePath
                 toDestinationPath:(NSIndexPath *)destinationPath;

@end
