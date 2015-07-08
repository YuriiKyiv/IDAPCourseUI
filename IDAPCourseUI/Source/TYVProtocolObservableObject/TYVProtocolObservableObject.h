//
//  TYVProtocolObservableObject.h
//  IDAPCoursesHomework
//
//  Created by Yurii Trokhymchuk on 5/14/15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYVSelector;

@interface TYVProtocolObservableObject : NSObject
@property (nonatomic, assign)   BOOL        shouldNotify;
@property (atomic, assign)      NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addObserver:(id)observer;

- (void)removeObserver:(id)observer;

- (BOOL)containsObserver:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object;

- (void)notify;

- (void)notifyWithObject:(id)object;

@end
