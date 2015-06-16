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

@property (nonatomic, assign)   BOOL animeted;

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
    self.animeted = YES;
    [self performSquarePositionWithPosition:(self.squareView.squarePosition + 1) % TYVSquarePositionTypeCount];
}

- (IBAction)onClickRandomButton:(id)sender {
    self.animeted = YES;
    [self performSquarePositionWithPosition:arc4random_uniform(TYVSquarePositionTypeCount)];
}

- (IBAction)onClickStopButton:(id)sender {
    self.animeted = NO;
}

#pragma mark -
#pragma mark Private Methods

- (void)performSquarePositionWithPosition:(TYVSquarePositionType)position {
    void (^block)(BOOL finished) = (self.animeted) ? ^(BOOL finished){
        [self performSquarePositionWithPosition:(self.squareView.squarePosition + 1) % TYVSquarePositionTypeCount];
    } : ^(BOOL finished){};
    
    [self.squareView setSquarePosition:position animated:YES completion:block];
}

- (void)makeBlock:(void(^)(void))block {
    __block BOOL animeted = YES;
    if (animeted) {
        block();
    }
    
}

@end
