//
//  TYVSquareViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVSquareViewController.h"
#import "TYVSquareView.h"
#import "TYVSquare.h"
#import "TYVMacro.h"

typedef TYVSquarePositionType(^TYVSquarePositionBlock)(void);

TYVViewControllerProperty(TYVSquareViewController, squareView, TYVSquareView)

@interface TYVSquareViewController ()
@property (nonatomic, assign, getter=isRunning)   BOOL running;

- (void)moveSquareToPosition:(TYVSquarePositionType)position;

- (void)moveSquareWithBlock:(TYVSquarePositionType(^)(void))block;

- (TYVSquarePositionBlock)randomPositionBlock;

- (TYVSquarePositionBlock)nextPositionBlock;

@end

@implementation TYVSquareViewController

#pragma mark -
#pragma mark Accessors

- (void)setSquare:(TYVSquare *)square {
    if (_square != square) {
        _square = square;
    }
    
    self.squareView.square = square;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onClickNextButton:(id)sender {
    self.running = YES;
    [self moveSquareWithBlock:[self nextPositionBlock]];
}

- (IBAction)onClickRandomButton:(id)sender {
    self.running = YES;
    [self moveSquareWithBlock:[self randomPositionBlock]];
}

- (IBAction)onClickStopButton:(id)sender {
    self.running = NO;
}

#pragma mark -
#pragma mark Private Methods

- (void)moveSquareToPosition:(TYVSquarePositionType)position {
    if (self.running) {
        [self.squareView setSquarePosition:position animated:YES completion:^(BOOL finished){
            if (finished) {
                self.square.position = position;
                [self moveSquareToPosition:(self.square.position + 1) % TYVSquarePositionTypeCount];
            }
        }];
    }
}

- (void)moveSquareWithBlock:(TYVSquarePositionType(^)(void))block {
    if (self.running) {
        TYVSquarePositionType position = block();
        [self.squareView setSquarePosition:position animated:YES completion:^(BOOL finished){
            if (finished) {
                self.square.position = position;
                [self moveSquareWithBlock:block];
            }
        }];
    }
}

- (TYVSquarePositionBlock)randomPositionBlock {
    TYVSquarePositionBlock result = ^{
        return (TYVSquarePositionType)arc4random_uniform(TYVSquarePositionTypeCount);
    };
    
    return result;
}

- (TYVSquarePositionBlock)nextPositionBlock {
    TYVSquarePositionBlock result = ^{
       return (self.square.position + 1) % TYVSquarePositionTypeCount;
    };
    
    return result;
}

#pragma mark -
#pragma mark Views Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.squareView.square = self.square;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
