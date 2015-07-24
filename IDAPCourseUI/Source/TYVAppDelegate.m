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
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "TYVLoginViewController.h"
#import "TYVFriendsViewController.h"
#import "TYVFBNavigationViewController.h"

static const NSUInteger kTYVDataArrayModelCount = 10;

@interface TYVAppDelegate ()
@property (nonatomic, strong)   TYVDataArrayModel   *model;

@end

@implementation TYVAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL result = [[FBSDKApplicationDelegate sharedInstance] application:application
                                           didFinishLaunchingWithOptions:launchOptions];
    [FBSDKLoginButton class];
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    TYVLoginViewController *controller = [TYVLoginViewController new];
    
    
    TYVFBNavigationViewController *navigationController = [[TYVFBNavigationViewController alloc] initWithRootViewController:controller];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end
