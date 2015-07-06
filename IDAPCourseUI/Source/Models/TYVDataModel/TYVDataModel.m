//
//  TYVDataModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataModel.h"

#import "NSString+TYVExtensions.h"

static NSString * const  kTYVImageName = @"image";
static NSString * const  kTYVImageType = @"jpeg";

static NSString * const  kTYVBigImageName = @"Orion_Nebula";
static NSString * const  kTYVBigImageType = @"jpg";

static NSString * const  kTYVTextField = @"text";

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
    }
    
    return self;
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
    NSString *path = [[NSBundle mainBundle] pathForResource:kTYVImageName ofType:kTYVImageType];
    self.image = [UIImage imageWithContentsOfFile:path];
    
    self.state = TYVAbstractDataModelDidLoad;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.text forKey:kTYVTextField];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.text = [decoder decodeObjectForKey:kTYVTextField];
    }
    
    return self;
}


@end
