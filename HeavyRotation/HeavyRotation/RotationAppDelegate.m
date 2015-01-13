//
//  RotationAppDelegate.m
//  HeavyRotation
//
//  Created by tirostiros on 15-1-13.
//  Copyright (c) 2015年 cn.com.tiros. All rights reserved.
//

#import "RotationAppDelegate.h"
#import "HeavyViewController.h"

@implementation RotationAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //需要设置旋转设备发送广播
    UIDevice *device = [UIDevice currentDevice];
    [device beginGeneratingDeviceOrientationNotifications];
    
    //接收广播
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(ratationNotify:) name:UIDeviceOrientationDidChangeNotification object:device];
    
    //plist中设置了设置可以使用的方向，所以代码不需要实现
    
    //再这个view中，使用autoresize，旋转时自动设置各个view大小
    HeavyViewController *heavy = [[HeavyViewController alloc] init];
    self.window.rootViewController = heavy;
    
    return YES;
}

-(void)ratationNotify:(NSNotification*)userInfo
{
    NSLog(@"%d",[[userInfo object] orientation]);
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
