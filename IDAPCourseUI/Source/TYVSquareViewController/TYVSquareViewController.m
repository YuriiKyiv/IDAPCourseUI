//
//  TYVSquareViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVSquareViewController.h"
#import "TYVSquareView.h"

@interface TYVSquareViewController ()
@property (nonatomic, strong)   TYVSquareView   *squareView;

@property (nonatomic, assign, getter=isRunning)   BOOL running;

- (void)performSquarePositionWithPosition:(TYVSquarePositionType)position;

@end

@implementation TYVSquareViewController

#pragma mark -
#pragma mark Accessors

- (TYVSquareView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TYVSquareView class]]) {
        return (TYVSquareView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

@end
