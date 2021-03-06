//
//  CFLogInViewController.m
//  Login
//
//  Created by   颜风 on 14-5-27.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFLogInViewController.h"
#import "CFLoginView.h"
#import "CFRegistView.h"
#import "CFGetPasswordView.h"
#import "CFLTView.h"

@interface CFLogInViewController ()

@end

@implementation CFLogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSMutableDictionary * tempInfoOfUsers = [[NSMutableDictionary alloc] initWithCapacity:42];
        self.infoOfUsers = tempInfoOfUsers;
        [tempInfoOfUsers release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.loginView;
}

- (BOOL)shouldAutorotate
{
    // 注册视图关闭随屏幕转动.
    if (self.view == self.registView) {
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - 重写方法
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CFLoginBaseView * base = (CFLoginBaseView *)self.view;
    [base.dictOfSubViews enumerateKeysAndObjectsUsingBlock:^(id key, UIView * obj, BOOL *stop) {
        
        CGPoint centerNew = obj.center; //!< 存储新的中心点.
        
        // 屏幕旋转:当从左移动到上,再移动到右,系统会认为是从左顺时针移到右.即当前位置是UIDeviceOrientationLandscapeLeft,将要旋转的方向是UIDeviceOrientationLandscapeRight;反之,依然.此时不需要做任何处理.
        
        // 一般情况,即旋转时没有屏幕倒立(home在下)的情况!
        if ( ! ([UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeLeft && toInterfaceOrientation == UIDeviceOrientationLandscapeRight) &&
            ! (toInterfaceOrientation  == UIDeviceOrientationLandscapeLeft && [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeRight) ) {
            centerNew = CGPointMake(obj.center.x + (self.view.bounds.size.height - self.view.bounds.size.width) / 2, obj.center.y);
        }
        
        // 设置新的中心点
        obj.center = centerNew;
        
    }];
}

#pragma mark - 实例方法

- (void) didClickButtonAction: (UIButton *) aButton
{
    // 回收键盘
    [self recycleKeyboard];
    
    // 定义一个字典,存储按钮文本框与对应的响应方法.相当于在做路由.
    NSDictionary * dictOfButtonMethod = @{@"注册": @"didClickRegistButtonAction:",
                                          @"返回": @"didClickBackButtonAction:",
                                          @"新人加入": @"didClickNewRegistButtonAction:",
                                          @"找回密码": @"didClickRetrievePwdButtonAction:",
                                          @"登录": @"didClickLogInButtonAction:",
                                          @"找回": @"didClickRetieveButtonAction:"};
    
    // 获取按钮文本信息
    NSString * buttonTitle = [aButton titleForState: UIControlStateNormal];
    
    [dictOfButtonMethod enumerateKeysAndObjectsUsingBlock:^(NSString * key, id obj, BOOL *stop) {
        if([key isEqualToString: buttonTitle]){
            if ([self respondsToSelector:NSSelectorFromString(obj)]) {
                [self performSelector:NSSelectorFromString(obj) withObject:aButton];
                * stop = YES;
            }
        }
    }];
}

- (void) didClickRegistButtonAction:(UIButton *)aButton
{
    // 获取注册页面的控件信息
    NSDictionary * info = [self.registView dictOfSubViews];
    
    // 获取信息
    CFLTView * userLTView = [info objectForKey:@"用户名"];
    CFLTView * pwdLTView = [info objectForKey:@"密码"];
    CFLTView * confirmField = [info objectForKey:@"确认密码"];
    
    NSString * user= userLTView.textField.text;
    NSString * pwd = pwdLTView.textField.text;
    NSString * confirm = confirmField.textField.text;
    
    // 判断
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    // 用户名或密码不能为空
    if ([user isEqualToString:@""] ||
        [pwd isEqualToString:@""]) {
        alertView.message = @"用户名或密码不能为空";
        [alertView show];
        [alertView release];
        return;
    }
    
    // 两次输入的密码不一致
    if (! [pwd isEqualToString:confirm]) {
        alertView.message = @"两次输入的密码不一致";
        [alertView show];
        [alertView release];
        return;
    }
    
    // 注册成功
    [self.infoOfUsers setObject:pwd forKey:user];
    
    [alertView show];
    [alertView release];
    
    // 清空页面登陆页面,转向登录界面
    [self emptyTextField];
    self.view = self.loginView;
    
}

- (void) didClickBackButtonAction:(UIButton *)aButton
{
    // 点击返回按钮,返回登录界面.
        [self emptyTextField];
    self.view = self.loginView;
}

- (void)didClickNewRegistButtonAction:(UIButton *)aButton
{
    // 点击"新人加入"按钮,前往注册页面
        [self emptyTextField];
    self.view = self.registView;
}
- (void) didClickRetrievePwdButtonAction: (UIButton *)aButton
{
    // 点击"找回密码按钮",前往找回密码页面
    [self emptyTextField];
    self.view = self.getPasswordView;
}

- (void) didClickLogInButtonAction: (UIButton *) aButton
{
    // 获取登录视图的控件字典
    NSDictionary * info = self.loginView.dictOfSubViews;
    
    // 获取用户输入的用户名和密码
    CFLTView * userLTView = [info objectForKey:@"用户名"];
    CFLTView * pwdLTView = [info objectForKey:@"密码"];
    
    NSString * user = userLTView.textField.text;
    NSString * pwd = pwdLTView.textField.text;
    
    // 与已经存储的正确的用户名和密码比较
    __block BOOL isUser = NO; //!< 是不是合法的用户
    
    [self.infoOfUsers enumerateKeysAndObjectsUsingBlock:^(NSString * aUser, NSString * aPwd, BOOL *stop) {
        if ([aUser isEqualToString:user] && [aPwd isEqualToString:pwd]) {
            isUser = YES;
            * stop = YES;
        }
    }];
    
    // 根据判断做出相应提示.
    UIAlertView * infoView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码错误!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    if (isUser == YES) {
        NSString * messageTemp = [[NSString alloc] initWithFormat:@"登录成功!欢迎您,%@", user];
        infoView.message = messageTemp;
        [messageTemp release];
    }
    
    [infoView show];
    
}

- (void) didClickRetieveButtonAction: (UIButton *) aButton
{
    // 响应找回密码页面的"找回" 按钮
    
    // 获取页面控件信息
    NSDictionary * info = [self.getPasswordView dictOfSubViews];
    
    // 获取文本框输入
    CFLTView * email = [info objectForKey:@"邮箱"];
    NSString * emailAddress = email.textField.text;
    
    // 收回软键盘
    [email.textField resignFirstResponder];
    
    // 判断是否是有效的邮箱地址
    NSString * regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isEmailAddress = [predicate evaluateWithObject:emailAddress];
    
    // 如果文本框输入的是有效的邮件地址,则给出提示后,自动跳转至"登录"页面;如果不是,给出提示后,则不做跳转
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"无效的电子邮件地址!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    if (isEmailAddress) {
        alertView.message = @"重置密码邮件已经发送您的邮箱!即将转到登录页面!";
        [alertView show];
        self.view =  self.loginView;
        return;
    }
    
    [alertView show];
}

-(void)dealloc
{
    self.loginView = nil;
    self.registView = nil;
    self.getPasswordView = nil;
    self.infoOfUsers = nil;
    
    [super dealloc];
}

#pragma mark - 工具方法
- (void) recycleKeyboard
{
    if ([self.view isKindOfClass:[CFLoginBaseView class]]) {
        [self.loginView.dictOfSubViews
         enumerateKeysAndObjectsUsingBlock:^(id key, CFLTView * obj, BOOL *stop) {
            if ([obj isKindOfClass:[CFLTView class]]) {
                [obj.textField resignFirstResponder];
            }
        }];
    }
}

- (void) emptyTextField
{
    if ([self.view isKindOfClass:[CFLoginBaseView class]]) {
        [self.loginView.dictOfSubViews
         enumerateKeysAndObjectsUsingBlock:^(id key, CFLTView * obj, BOOL *stop) {
             if ([obj isKindOfClass:[CFLTView class]]) {
                 obj.textField.text = nil;
             }
         }];
    }
}

@end
