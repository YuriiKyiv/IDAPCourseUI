//
//  TYVProtocolObservableObject.m
//  IDAPCoursesHomework
//
//  Created by Yurii Trokhymchuk on 5/14/15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVProtocolObservableObject.h"
#import "TYVDispatch.h"

typedef void(^TYVNotifyBlock)(id, id);

@interface TYVProtocolObservableObject ()
@property (nonatomic, retain) NSHashTable   *observersHashTable;

- (void)notifyWithSelector:(SEL)selector;
- (void)notifyWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyWithSelector:(SEL)selector withObject:(id)object block:(TYVNotifyBlock)block;
- (void)notify;

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
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observersSet {
    @synchronized(self) {
        return self.observersHashTable.setRepresentation;
    }
}

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        _state = state;
        
        TYVDispatchSyncOnMainQueueWithBlock(^{[self notify];});
    }
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        _state = state;
        
        TYVDispatchSyncOnMainQueueWithBlock(^{[self notifyWithObject:object];});
    }
}

- (NSUInteger)state {
    @synchronized (self) {
        return _state;
    }
}

#pragma mark -
#pragma mark Public Methods

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

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object {
    return NULL;
}

#pragma mark -
#pragma mark Private Methods

- (void)notify {
    [self notifyWithSelector:[self selectorForState:_state]];
}

- (void)notifyWithObject:(id)object {
    [self notifyWithSelector:[self selectorForState:_state] withObject:object];
}

- (void)notifyWithSelector:(SEL)selector {
//    NSHashTable *observers = self.observersHashTable;
//    for (id observer in observers) {
//        if ([observer respondsToSelector:selector]) {
//            [observer performSelector:selector withObject:self];
//        }
//    }

    id block = ^(id observer, id object){
        [observer performSelector:selector withObject:self];
    };
    
    [self notifyWithSelector:selector withObject:nil block:block];
}

- (void)notifyWithSelector:(SEL)selector withObject:(id)object {
    NSHashTable *observers = self.observersHashTable;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}


- (void)notifyWithSelector:(SEL)selector withObject:(id)object block:(TYVNotifyBlock)block {
    NSHashTable *observers = self.observersHashTable;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            block(observer, object);
        }
    }
}

@end
