//
//  TYVDataModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataModel.h"

#import "NSString+TYVExtensions.h"

static NSString *const  kTYVImageName = @"image";
static NSString *const  kTYVImageType = @"jpeg";

@interface TYVDataModel ()
@property (nonatomic, strong)   UIImage *image;

@end

@implementation TYVDataModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    return [[self alloc] initWithString:[NSString randomString]];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.text = string;
        [self load];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private Methods

- (void)load {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:kTYVImageName ofType:kTYVImageType];
        self.image = [UIImage imageWithContentsOfFile:path];
        self.state = TYVImageLoaded;
    });
}

#pragma mark -
#pragma mark Observer Object

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TYVImageLoaded:
            return @selector(dataModelDidLoadImage:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.text forKey:@"text"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        _text = [decoder decodeObjectForKey:@"text"];
    }
    
    return self;
}


@end
