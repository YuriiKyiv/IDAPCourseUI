//
//  TYVFBNavigationViewController.m
//  IDAPCourseUI
//
//  Created by YURII on 22.07.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVFBNavigationViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "TYVFriendsViewController.h"

@interface TYVFBNavigationViewController ()

- (void)FBSDKAccessTokenDidChange:(NSNotification *)notification;

@end

@implementation TYVFBNavigationViewController

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:FBSDKAccessTokenDidChangeNotification object:nil];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(FBSDKAccessTokenDidChange:)
                       name:FBSDKAccessTokenDidChangeNotification
                     object:nil];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark FBSDKAccessTokenDidChangeNotification

- (void)FBSDKAccessTokenDidChange:(NSNotification *)notification {
    if ([FBSDKAccessToken currentAccessToken]) {
        [self pushViewController:[TYVFriendsViewController new] animated:YES];
    }
}

@end
