//
//  TYVFriendsViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFriendsViewController.h"
#import "TYVUserContext.h"
#import "TYVUserModel.h"

@interface TYVFriendsViewController ()

@end

@implementation TYVFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TYVUserModel *model = [TYVUserModel new];
    model = [TYVUserContext userModelWithModel:model];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
