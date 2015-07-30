//
//  TYVProtocolObservableObject.m
//  IDAPCoursesHomework
//
//  Created by Yurii Trokhymchuk on 5/14/15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVProtocolObservableObject.h"

@interface TYVProtocolObservableObject ()
@property (nonatomic, retain) NSHashTable   *observersHashTable;

- (void)notifyWithSelector:(SEL)selector withObject:(id)object;

- (void)performBlock:(TYVBlock)block WithNotificationState:(BOOL)state;

@end

@implementation TYVProtocolObservableObject

@synthesize state = _state;

@dynamic observersSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
        self.shouldNotify = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state  {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        _state = state;
        
        if (self.shouldNotify) {
            [self notifyWithObject:object];
        }
    }
}

- (NSUInteger)state {
    @synchronized (self) {
        return _state;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)performBlockWithoutNotification:(TYVBlock)block {
    [self performBlock:block WithNotificationState:NO];
}

- (void)performBlockWithNotification:(TYVBlock)block {
    [self performBlock:block WithNotificationState:YES];
}

- (void)addObserver:(id)observer {
    @synchronized(self) {
        [self.observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
        [self.observersHashTable removeObject:observer];
    }
}

- (BOOL)containsObserver:(id)observer {
    @synchronized(self) {
        return [self.observersHashTable containsObject:observer];
    }
    
}

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)notify {
    [self notifyWithObject:nil];
}

- (void)notifyWithObject:(id)object {
    @synchronized (self) {
        [self notifyWithSelector:[self selectorForState:_state] withObject:object];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)performBlock:(TYVBlock)block WithNotificationState:(BOOL)state {
    @synchronized (self) {
        BOOL tmpState = self.shouldNotify;
        self.shouldNotify = state;
        block();
        self.shouldNotify = tmpState;
    }
}

- (void)notifyWithSelector:(SEL)selector withObject:(id)object {
    NSHashTable *observers = self.observersHashTable;
#warning check synchronized
    @synchronized (observers) {
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self withObject:object];
            }
        }
    }
}

@end
