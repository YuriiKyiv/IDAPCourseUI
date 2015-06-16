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
    TYVSquareView *view = self.squareView;
    TYVSquarePositionType squarePosition = (view.squarePosition + 1) % TYVSquarePositionTypeCount;
    [view setSquarePosition:squarePosition animated:YES];
}

- (IBAction)onClickRandomButton:(id)sender {
    TYVSquareView *view = self.squareView;
    TYVSquarePositionType squarePosition = (arc4random_uniform(TYVSquarePositionTypeCount));
    [view setSquarePosition:squarePosition animated:YES];
}

- (IBAction)onClickStopButton:(id)sender {

}

@end
