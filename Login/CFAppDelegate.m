//
//  CFAppDelegate.m
//  Login
//
//  Created by   颜风 on 14-5-22.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFAppDelegate.h"

@implementation CFAppDelegate

- (instancetype)init
{
    if (self = [super init]) {
        self.textFieldsOfSignIn = [[NSMutableDictionary alloc] initWithCapacity:42];
    }
    
    return self;
}

- (void)dealloc
{
    self.window = nil;
    self.textFieldsOfSignIn = nil;
    self.emailField = nil;
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // 灰色主窗口背景.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
    

    
#pragma mark - 作业 2014-5-25
    //作业一
    // [self homeWorkOne];
    
    //作业二
    [self homeWorkTwo];
    
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

#pragma mark - 作业
/**
 *  
 作业一：注册页面
 1、使用UILabel、UITextField、UIButton、UIAlertView实现注册页面。
 2、点击任何UITextField的return键都能回收键盘
 3、密码和确认密码采用密文输入
 4、手机号的UITextField使用数字键盘
 5、邮箱的UITextField使用邮箱键盘
 6、点击注册按钮时进行是否注册成功的判断：
 (1)用户名、密码、确认密码的3个UITextField的文本均不能为空，才能认为注册成功
 (2)密码和确认密码的UITextField的文本必须相同，才能认为注册成功
 (3)如果注册成功，弹出提示框。
 (4)如果注册失败，弹出提示框。(两种情况：两次输入的密码不一致；用户名或密码不能为空)
 */
- (void) homeWorkOne
{
    // 基准Rect,在此基础上进行视图Rect的设置.
    CGRect baseRect = [[UIScreen mainScreen] bounds];
    
    // 两个Rect
    CGRect rectOfLabel = CGRectMake(20, 50, 70, 25);
    CGRect rectOfTextField = CGRectMake(rectOfLabel.origin.x + rectOfLabel.size.width +10, rectOfLabel.origin.y, baseRect.size.width - 2*rectOfLabel.origin.x - (rectOfLabel.size.width + 10), rectOfLabel.size.height);
    NSArray * labelText = @[@"用户名", @"密码", @"确认密码", @"手机号", @"邮箱", @"住址"];
    for (NSInteger i = 0; i < 6; i++)
    {
        // 新建两个视图对象:
        UILabel * label = [[UILabel alloc]initWithFrame:rectOfLabel];
        UITextField * textField = [[UITextField alloc] initWithFrame :rectOfTextField];
        
        // 设置视图属性
        label.text = [labelText objectAtIndex:i];
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        // 密码和确认密码采用密文输入
        if([label.text isEqualToString:@"密码"]
           ||[label.text isEqualToString:@"确认密码"]){
            textField.secureTextEntry = YES;
        }
        
        // 手机号的UITextField使用数字键盘
        if ([label.text isEqualToString:@"手机号"]) {
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }

        // 邮箱的UITextField使用邮箱键盘
        if ([label.text isEqualToString:@"邮箱"]) {
            textField.keyboardType = UIKeyboardTypeEmailAddress;
        }
        
        // 点击任何UITextField的return键都能回收键盘
        [textField setDelegate:self];
        
        
        // 添加到存储注册页面文本框数组的字典中.
        [self.textFieldsOfSignIn setObject: textField forKey:label.text];
        
        // 视图添加到窗口.
        [self.window addSubview:label];
        [self.window addSubview:textField];
        
        //真正变化的量
        float change = rectOfLabel.size.height + 20;
        rectOfLabel.origin.y += change;
        rectOfTextField.origin.y += change;
        
        // 释放视图对象
        [label release];
        [textField release];
        
    }
    
    // 最后一行:两个按钮
    
    // 两个Rect
    CGRect rectOfSignInButton = CGRectMake(rectOfLabel.origin.x+30, rectOfLabel.origin.y + 20, (baseRect.size.width - 2 * 60 - 20) / 2, rectOfLabel.size.height);
    CGRect rectOfCancelButton = CGRectMake(rectOfSignInButton.origin.x + rectOfSignInButton.size.width + 20, rectOfSignInButton.origin.y, rectOfSignInButton.size.width, rectOfSignInButton.size.height);
    
    // 新建两个按钮对象
    UIButton * signInButton = [UIButton buttonWithType:UIButtonTypeSystem];
    signInButton.Frame = rectOfSignInButton;
    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelButton.frame = rectOfCancelButton;
    
    // 设置属性
    [signInButton setTitle: @"注册" forState:UIControlStateNormal];
    [cancelButton setTitle: @"取消" forState:UIControlStateNormal];

    // 点击注册按钮时进行是否注册成功的判断：
    // ???: 如何使类方法做出相应!??
    [signInButton addTarget:self action:@selector(didClickSignInButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加到窗口
    [self.window addSubview:signInButton];
    [self.window addSubview:cancelButton];
}

// 点击任何UITextField的return键都能回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// 点击注册按钮时进行判断.
- (void) didClickSignInButtonAction: (UIButton *) button
{
    // 获取需要用到的文本框对象.
    UITextField * userField = [self.textFieldsOfSignIn objectForKey:@"用户名"];
    UITextField * pwdField = [self.textFieldsOfSignIn objectForKey:@"密码"];
    UITextField * confirmField = [self.textFieldsOfSignIn objectForKey: @"确认密码"];
    
    // 判断
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    // 用户名或密码不能为空
    if ([userField.text isEqualToString:@""] ||
        [pwdField.text isEqualToString:@""]) {
        alertView.message = @"用户名或密码不能为空";
        [alertView show];
        [alertView release];
        return;
    }
    
    // 两次输入的密码不一致
    if (! [pwdField.text isEqualToString:confirmField.text]) {
        alertView.message = @"两次输入的密码不一致";
        [alertView show];
        [alertView release];
        return;
    }
    
    // 注册成功
    [alertView show];
    [alertView release];
    
}

/**
 *  作业二：找回密码页面
 1、使用UITextField、UIButton、UIAlertView实现找回密码页面。†
 2、点击UITextField的return键能回收键盘†
 3、定义宏，设置正确的邮箱字符串，通过比较输入的字符串和宏定义的邮箱字符串是否相等，完成找回密码是否成功的判断。†
 4、找回成功和失败均显示提示框，并且回收键盘†
 */
- (void) homeWorkTwo
{
    // 在屏幕参数的基础上进行数据的设置
    CGRect baseRect = [[UIScreen mainScreen] bounds];
    
    // 文本框
    self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(baseRect.origin.x + 50, baseRect.origin.y + 100, baseRect.size.width - 2*50, baseRect.size.height*0.07)];
    self.emailField.placeholder = @"电子邮箱";
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.keyboardType = UIKeyboardTypeEmailAddress;
    // 点击UITextField的return键能回收键盘
    self.emailField.delegate = self;
    
    [self.window addSubview: self.emailField];
    
    // 两个按钮
    UIButton * retrieveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    // ???: bouds和frame属性,不同吗?
    retrieveButton.frame = CGRectMake(self.emailField.frame.origin.x, self.emailField.frame.origin.y + self.emailField.frame.size.height + 20, (self.emailField.frame.size.width - 30) / 2, self.emailField.frame.size.height);
    [retrieveButton setTitle:@"找回" forState:UIControlStateNormal];
    
    [retrieveButton addTarget:self action:@selector(didClickRetriveButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:retrieveButton];
    
    UIButton * cancelButton = [UIButton buttonWithType: UIButtonTypeSystem];
    cancelButton.frame = CGRectMake(retrieveButton.frame.origin.x + retrieveButton.frame.size.width + 30, retrieveButton.frame.origin.y, retrieveButton.frame.size.width, retrieveButton.frame.size.height);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.window addSubview:cancelButton];

}

/**
 * 定义宏，设置正确的邮箱字符串，通过比较输入的字符串和宏定义的邮箱字符串是否相等，完成找回密码是否成功的判断。
   找回成功和失败均显示提示框，并且回收键盘
 *
 *  @param button 按下的按钮
 */
- (void) didClickRetriveButtonAction: (UIButton *) button
{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    
    // 找回成功?
    if (NO == [self.emailField.text isEqualToString:EMAIL]) {
        alertView.message = @"找回失败";
        [alertView show];
        return;
    }
    
    alertView.message = @"找回成功";
    [alertView show];
}
@end
