//
//  TYVDataModel.m
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVDataModel.h"
#import "TYVImageModel.h"

#import "NSString+TYVExtensions.h"

static NSString * const  kTYVImageName = @"image";
static NSString * const  kTYVImageType = @"jpeg";

static NSString * const  kTYVBigImageName = @"Orion_Nebula";
static NSString * const  kTYVBigImageType = @"jpg";

static NSString * const  kTYVTextField = @"text";

static NSString * const  kTYVImageUrl = @"http://cdn-www.i-am-bored.com/media/thumbnails/apple_for-diabetics[1].jpg";

@interface TYVDataModel ()
@property (nonatomic, strong)   TYVImageModel *imageModel;

@end

@implementation TYVDataModel

@dynamic image;

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
        self.imageModel = [TYVImageModel imageWithURL:[NSURL URLWithString:kTYVImageUrl]];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessor

- (UIImage *)image {
    return self.imageModel.image;
}

#pragma mark -
#pragma mark TYVAbstractDataModel

- (void)performLoading {
//    NSString *path = [[NSBundle mainBundle] pathForResource:kTYVImageName ofType:kTYVImageType];
//    self.image = [UIImage imageWithContentsOfFile:path];
    
    [self.imageModel load];
    
    self.state = TYVModelLoaded;
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
