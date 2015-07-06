//
//  TYVAbstractDataModel.h
//  IDAPCourseUI
//
//  Created by YURII on 02.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVProtocolObservableObject.h"

typedef NS_ENUM(NSUInteger, TYVAbstractDataModelState) {
    TYVAbstractDataModelDidUnload,
    TYVAbstractDataModelWillLoad,
    TYVAbstractDataModelDidLoad,
    TYVAbstractDataModelDidFailedLoading,
    TYVAbstractDataModelDidChange
};

@interface TYVAbstractDataModel : TYVProtocolObservableObject

// do not call this methods directly
// This is the method for overriding
// You have to set the state in this method manually
- (void)performLoading;

// do not call this methods directly
// This is the method for overriding
- (void)setupLoading;

- (void)load;

@end
