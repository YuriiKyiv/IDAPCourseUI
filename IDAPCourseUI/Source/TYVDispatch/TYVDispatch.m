//
//  TYVDispatch.m
//  IDAPCoursesHomework
//
//  Created by YURII on 10.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYVDispatch.h"
#import "TYVProtocolObservableObject.h"

#pragma mark -
#pragma mark Public Implementations

void TYVDispatchSyncOnMainQueueWithBlock(TYVBlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void TYVDispatchAsyncOnMainQueueWithBlock(TYVBlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

void TYVDispatchAsyncOnDefaultQueueWithBlock(TYVBlock block) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
