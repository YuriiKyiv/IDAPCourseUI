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
        if (TYVModelUnloaded == self.state
            || TYVModelFailedLoading == self.state)
        {
            self.state = TYVModelWillLoad;
            
            [self setupLoading];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [self performLoading];
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
        case TYVModelLoaded:
            return @selector(dataModelDidLoad:);
        
        case TYVModelWillLoad:
            return @selector(dataModelWillLoad:);
            
        case TYVModelFailedLoading:
            return @selector(dataModelDidFailedLoading:);
            
        case TYVModelUnloaded:
            return @selector(dataModelDidUnload:);
            
        case TYVModelDidChange:
            return @selector(dataModel:didChangeWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
