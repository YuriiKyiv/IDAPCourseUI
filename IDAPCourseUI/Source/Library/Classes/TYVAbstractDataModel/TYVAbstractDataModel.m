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
        if (TYVAbstractDataModelDidUnload == self.state
            || TYVAbstractDataModelDidFailedLoading == self.state)
        {
            self.state = TYVAbstractDataModelWillLoad;
            
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
        case TYVAbstractDataModelDidLoad:
            return @selector(dataModelDidLoad:);
        
        case TYVAbstractDataModelWillLoad:
            return @selector(dataModelWillLoad:);
            
        case TYVAbstractDataModelDidFailedLoading:
            return @selector(dataModelDidFailedLoading:);
            
        case TYVAbstractDataModelDidUnload:
            return @selector(dataModelDidUnload:);
            
        case TYVAbstractDataModelDidChange:
            return @selector(dataModel:didChangeWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
