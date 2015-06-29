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

@end

@implementation TYVAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
//    TYVSquareViewController *controller = [TYVSquareViewController new];
//    controller.square = [[TYVSquare alloc] initWithSquarePosition:TYVBottomRightCorner];
    
    TYVDataArrayModel *dataArray = [TYVDataArrayModel dataWithModelsCount:kTYVDataArrayModelCount];
    TYVTableViewController *controller = [TYVTableViewController new];
    controller.dataArray = dataArray;
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [(TYVTableViewController *)self.window.rootViewController save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [(TYVTableViewController *)self.window.rootViewController save];
}

@end
