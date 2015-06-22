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

@interface TYVAppDelegate ()

@end

@implementation TYVAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
//    TYVSquareViewController *controller = [TYVSquareViewController new];
//    controller.square = [[TYVSquare alloc] initWithSquarePosition:TYVBottomRightCorner];
    
    TYVDataArrayModel *dataArray = [TYVDataArrayModel new];
    for (int i = 0; i < 10; i++) {
        [dataArray addModel:[TYVDataModel new]];
    }
    
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
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
