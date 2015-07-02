//
//  TYVAbstractDataModel.h
//  IDAPCourseUI
//
//  Created by YURII on 02.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVProtocolObservableObject.h"

typedef NS_ENUM(NSUInteger, TYVAbstractDataModelState) {
    TYVAbstractDataModelUnloaded,
    TYVAbstractDataModelLoading,
    TYVAbstractDataModelLoaded,
    TYVAbstractDataModelFailedLoading,
    TYVAbstractDataModelDidChange
};

@interface TYVAbstractDataModel : TYVProtocolObservableObject

@end
