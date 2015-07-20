//
//  TYVDataArrayModel.h
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVModelArray.h"

@interface TYVDataArrayModel : TYVModelArray

- (void)save;

- (void)saveWithCompletionHandler:(TYVBlock)block;

@end
