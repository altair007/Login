//
//  CFAppDelegate.m
//  Login
//
//  Created by   颜风 on 14-5-22.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFAppDelegate.h"
#import "CFLogInViewController.h"
#import "CFLoginView.h"
#import "CFRegistView.h"
#import "CFGetPasswordView.h"


@implementation CFAppDelegate

- (void)dealloc
{
    self.window = nil;
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow * windowTemp = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = windowTemp;
    [windowTemp release];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // 开始登陆吧
    CFLogInViewController * controller;
    controller = [[CFLogInViewController alloc] init];
    
    CFLoginView * aLoginView = [[CFLoginView alloc] initWithFrame:self.window.frame delegate:controller infoOfLables:@[@"用户名", @"密码"] infoOfButtons:@[@"登录", @"找回密码", @"新人加入"]];
    
    CFRegistView * aRegistView = [[CFRegistView alloc] initWithFrame:self.window.frame delegate:controller infoOfLables:@[@"用户名", @"密码", @"确认密码", @"手机号", @"邮箱", @"住址"] infoOfButtons:@[@"注册", @"返回"]];
    
    CFGetPasswordView * aGetPasswordView = [[CFGetPasswordView alloc] initWithFrame:self.window.frame delegate:controller infoOfLables:@[@"邮箱"] infoOfButtons:@[@"找回", @"返回"]];
    
    
    controller.loginView = aLoginView;
    controller.registView = aRegistView;
    controller.getPasswordView = aGetPasswordView;
    self.window.rootViewController = controller;
    
    
    [controller release];
    [aLoginView release];
    [aRegistView release];
    [aGetPasswordView release];
    
    return YES;
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
