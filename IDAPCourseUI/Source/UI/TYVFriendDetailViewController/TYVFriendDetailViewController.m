//
//  TYVFriendDetailViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFriendDetailViewController.h"
#import "TYVUserContext.h"
#import "TYVUserModel.h"
#import "TYVFriendDetailView.h"
#import "TYVMacro.h"

TYVViewControllerProperty(TYVFriendDetailViewController, friendDetailView, TYVFriendDetailView)

@interface TYVFriendDetailViewController ()
@property (nonatomic, strong) TYVUserContext    *context;

@end

@implementation TYVFriendDetailViewController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TYVUserModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
        
        self.context = [TYVUserContext contextWithModel:_model];
    }
}

- (void)setContext:(TYVUserContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [_context execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendDetailView.model = self.model;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
