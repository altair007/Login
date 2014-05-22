//
//  CFAppDelegate.m
//  Login
//
//  Created by   颜风 on 14-5-22.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFAppDelegate.h"

@implementation CFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // 灰色主窗口背景.
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    self.window.tintColor = [UIColor redColor];
    // 第一张图:
//    // 红色视图
//    CGRect rectOfRedViewUp = CGRectMake(45, 80, 90, 25);
//    UIView * redViewUp = [[[UIView alloc] initWithFrame:rectOfRedViewUp] autorelease];
//    redViewUp.backgroundColor = [UIColor redColor];
//    [self.window addSubview: redViewUp];
//    
//    CGRect rectOfRedViewDown = CGRectMake(redViewUp.frame.origin.x, redViewUp.frame.origin.y + redViewUp.frame.size.height + 15, redViewUp.frame.size.width, redViewUp.frame.size.height);
//    UIView * redViewDown = [[[UIView alloc] initWithFrame:rectOfRedViewDown] autorelease];
//    redViewDown.backgroundColor = [UIColor redColor];
//    [self.window addSubview:redViewDown];
//    
//    // 蓝色视图
//    UIView * blueViewUp = [[UIView alloc] initWithFrame:CGRectMake(redViewUp.frame.origin.x + redViewUp.frame.size.width + 20, redViewUp.frame.origin.y, redViewUp.frame.size.width + 20, redViewUp.frame.size.height)];
//    blueViewUp.backgroundColor = [UIColor blueColor];
//    [self.window addSubview: blueViewUp];
//    
//    UIView * blueViewDown = [[UIView alloc] initWithFrame:CGRectMake(blueViewUp.frame.origin.x, redViewDown.frame.origin.y, blueViewUp.frame.size.width, blueViewUp.frame.size.height)];
//    blueViewDown.backgroundColor = blueViewUp.backgroundColor;
//    [self.window addSubview:blueViewDown];
//    
//    // 绿色视图
//    UIView * greenViewLeft = [[UIView alloc] initWithFrame:CGRectMake(redViewUp.frame.origin.x, redViewDown.frame.origin.y + redViewDown.frame.size.height + 15, (blueViewUp.frame.origin.x + blueViewUp.frame.size.width -redViewUp.frame.origin.x - 2 * 20)/3, redViewUp.frame.size.height)];
//    greenViewLeft.backgroundColor = [UIColor greenColor];
//    [self.window addSubview: greenViewLeft];
//    
//    UIView * greenViewMiddle = [[UIView alloc] initWithFrame:CGRectMake(greenViewLeft.frame.origin.x + greenViewLeft.frame.size.width + 20, greenViewLeft.frame.origin.y, greenViewLeft.frame.size.width, greenViewLeft.frame.size.height)];
//    greenViewMiddle.backgroundColor = greenViewLeft.backgroundColor;
//    [self.window addSubview: greenViewMiddle];
//    
//    UIView * greenViewRight = [[UIView alloc] initWithFrame:CGRectMake(greenViewMiddle.frame.origin.x + greenViewMiddle.frame.size.width + 20, greenViewLeft.frame.origin.y, greenViewLeft.frame.size.width, greenViewLeft.frame.size.height)];
//    greenViewRight.backgroundColor = greenViewLeft.backgroundColor;
//    [self.window addSubview: greenViewRight];
    
    // 第二张图
//    // 在屏幕参数的基础上进行数据的设置
//    CGRect baseRect = [[UIScreen mainScreen] bounds];
//    
//    // 蓝色的图
//    UIView * blueView = [[UIView alloc] initWithFrame:CGRectMake(baseRect.origin.x + 50, baseRect.origin.y + 100, baseRect.size.width - 2*50, baseRect.size.height*0.07)];
//    blueView.backgroundColor = [UIColor blueColor];
//    [self.window addSubview: blueView];
//    
//    // 绿色的图
//    UIView * greenViewLeft = [[UIView alloc] initWithFrame:CGRectMake(blueView.frame.origin.x, blueView.frame.origin.y + blueView.frame.size.height + 20, (blueView.frame.size.width - 30) / 2, blueView.frame.size.height)];
//    greenViewLeft.backgroundColor = [UIColor greenColor];
//    [self.window addSubview:greenViewLeft];
//    
//    UIView * greenViewRight = [[UIView alloc] initWithFrame:CGRectMake(greenViewLeft.frame.origin.x + greenViewLeft.frame.size.width + 30, greenViewLeft.frame.origin.y, greenViewLeft.frame.size.width, greenViewLeft.frame.size.height)];
//    greenViewRight.backgroundColor = greenViewLeft.backgroundColor;
//    [self.window addSubview:greenViewRight];
    
    // 第三张图
    // 前六行
    // 基准Rect,在此基础上进行视图Rect的设置.
    CGRect baseRect = [[UIScreen mainScreen] bounds];
    
    // 两个Rect
    CGRect redRect = CGRectMake(60, 50, 50, 25);
    CGRect blueRect = CGRectMake(redRect.origin.x + redRect.size.width +10, redRect.origin.y, baseRect.size.width - 2*redRect.origin.x - (redRect.size.width + 10), redRect.size.height);
    
    for (NSInteger i = 0; i < 6; i++)
    {
        // 新建两个视图对象
        UIView * redView = [[[UIView alloc]initWithFrame:redRect] autorelease];
        UIView * blueView = [[[UIView alloc] initWithFrame :blueRect] autorelease];
        
        // 设置视图属性
        redView.backgroundColor = [UIColor redColor];
        blueView.backgroundColor = [UIColor blueColor];
        
        // 视图添加到窗口.
        [self.window addSubview:redView];
        [self.window addSubview:blueView];
        
        //真正变化的量
        float change = redRect.size.height + 20;
        redRect.origin.y += change;
        blueRect.origin.y += change;
    }
    
    // 最后一行:两个黄色视图
    
    // 两个Rect
    CGRect leftRect = CGRectMake(redRect.origin.x, redRect.origin.y + 20, (baseRect.size.width - 2 * 60 - 20) / 2, redRect.size.height);
    CGRect rightRect = CGRectMake(leftRect.origin.x + leftRect.size.width + 20, leftRect.origin.y, leftRect.size.width, leftRect.size.height);
    
    // 新建两个视图对象
    UIView * yellowViewLeft = [[UIView alloc] initWithFrame:leftRect];
    UIView * yellowViewRight = [[UIView alloc] initWithFrame:rightRect];
    
    // 设置属性
    yellowViewLeft.backgroundColor = [UIColor yellowColor];
    yellowViewRight.backgroundColor = yellowViewLeft.backgroundColor;
    
    // 添加到窗口
    [self.window addSubview:yellowViewLeft];
    [self.window addSubview:yellowViewRight];
    
    
    
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
