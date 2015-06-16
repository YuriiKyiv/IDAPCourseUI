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

@interface TYVSquareViewController ()
@property (nonatomic, readonly)   TYVSquareView   *squareView;

@property (nonatomic, assign, getter=isRunning)   BOOL running;

- (void)performSquarePositionWithPosition:(TYVSquarePositionType)position;

@end

@implementation TYVSquareViewController

@dynamic squareView;

#pragma mark -
#pragma mark Accessors

- (TYVSquareView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TYVSquareView class]]) {
        return (TYVSquareView *)self.view;
    }
    
    return nil;
}

- (void)setSquare:(TYVSquare *)square {
    if (_square != square) {
        _square = square;
    }
    
    self.squareView.squarePosition = square.position;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onClickNextButton:(id)sender {
    self.running = YES;
    [self performSquarePositionWithPosition:(self.squareView.squarePosition + 1) % TYVSquarePositionTypeCount];
}

- (IBAction)onClickRandomButton:(id)sender {
    self.running = YES;
    [self performSquarePositionWithPosition:arc4random_uniform(TYVSquarePositionTypeCount)];
}

- (IBAction)onClickStopButton:(id)sender {
    self.running = NO;
}

#pragma mark -
#pragma mark Private Methods

- (void)performSquarePositionWithPosition:(TYVSquarePositionType)position {
    void (^block)(BOOL finished) = (self.running) ? ^(BOOL finished){
        [self performSquarePositionWithPosition:(self.squareView.squarePosition + 1) % TYVSquarePositionTypeCount];
    } : ^(BOOL finished){};
    
    [self.squareView setSquarePosition:position animated:YES completion:block];
}

#pragma mark -
#pragma mark Views Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.squareView.squarePosition = self.square.position;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
