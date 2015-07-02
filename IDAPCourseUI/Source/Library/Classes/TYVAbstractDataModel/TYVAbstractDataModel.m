//
//  TYVAbstractDataModel.m
//  IDAPCourseUI
//
//  Created by YURII on 02.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAbstractDataModel.h"
#import "TYVAbstractDataModelProtocol.h"

@implementation TYVAbstractDataModel

#pragma mark -
#pragma mark Public Methods

- (void)load {
    @synchronized (self) {
        if (TYVAbstractDataModelUnloaded == self.state
            || TYVAbstractDataModelFailedLoading == self.state)
        {
            self.state = TYVAbstractDataModelLoading;
            
            [self setupLoading];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [self performLoading];
                
                self.state = TYVAbstractDataModelLoaded;
            });
        } else {
            [self notify];
        }
    }
}

- (void)performLoading {
    
}

- (void)setupLoading {
    
}

#pragma mark -
#pragma mark ObserverObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TYVAbstractDataModelLoaded:
            return @selector(dataModelLoaded:);
        
        case TYVAbstractDataModelLoading:
            return @selector(dataModelLoading:);
            
        case TYVAbstractDataModelFailedLoading:
            return @selector(dataModelFailedLoading:);
            
        case TYVAbstractDataModelUnloaded:
            return @selector(dataModelUnloaded:);
            
        case TYVAbstractDataModelDidChange:
            return @selector(dataModel:didChangeWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
