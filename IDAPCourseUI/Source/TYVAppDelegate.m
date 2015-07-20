//
//  TYVAppDelegate.m
//  IDAPCourseUI
//
//  Created by YURII on 15.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#import "TYVAppDelegate.h"
#import "TYVSquareViewController.h"
#import "UIWindow+TYVExtentions.h"
#import "TYVSquare.h"
#import "TYVTableViewController.h"
#import "TYVDataModel.h"
#import "TYVDataArrayModel.h"

static const NSUInteger kTYVDataArrayModelCount = 10;

@interface TYVAppDelegate ()
@property (nonatomic, strong)   TYVDataArrayModel   *model;

@end

@implementation TYVAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
//    TYVSquareViewController *controller = [TYVSquareViewController new];
//    controller.square = [[TYVSquare alloc] initWithSquarePosition:TYVBottomRightCorner];
    
    TYVDataArrayModel *dataArray = [TYVDataArrayModel dataWithModelsCount:kTYVDataArrayModelCount];
    self.model = dataArray;
    
    TYVTableViewController *controller = [TYVTableViewController new];
    controller.dataArray = dataArray;
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.model save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate");
}

@end
