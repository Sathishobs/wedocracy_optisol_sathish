//
//  AppDelegate.m
//  wedocracy-ios-test-sathish_jdev
//
//  Created by Sathish on 20/06/14.
//  Copyright (c) 2014 Optisol Business Solutions pvt ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _viewController = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
    application.statusBarHidden = YES;
    self.window.rootViewController = _viewController;
    [self.window makeKeyAndVisible];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(onSlashScreenDone)userInfo:nil repeats:NO];
    
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |
                                                                           UIRemoteNotificationTypeBadge |
                                                                           UIRemoteNotificationTypeSound)];
    //Remote notification info
    NSDictionary *remoteNotif = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
    
    //Accept push notification when app is not open
    if (remoteNotif) {
        [self application:application didReceiveRemoteNotification:remoteNotif];
    }
    
    return YES;
}

- (void)onSlashScreenDone{
    [_viewController.view removeFromSuperview];
    LandingVC  *viewController = nil;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        viewController = [[LandingVC alloc] initWithNibName:@"LandingVC_iPad" bundle:[NSBundle mainBundle]];
        
    }else if (IS_IPHONE_5) {
        viewController = [[LandingVC alloc] initWithNibName:@"LandingVC" bundle:[NSBundle mainBundle]];
    } else {
        viewController = [[LandingVC alloc] initWithNibName:@"LandingVC_iPhone4" bundle:[NSBundle mainBundle]];
    }
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    ApplicationDelegate.window.rootViewController = navController;
    
    // get down retain count
    [viewController release];
    [navController release];
    [_viewController release];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
