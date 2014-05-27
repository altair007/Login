//
//  CFLogIn.m
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFLogIn.h"
#import "CFLoginView.h"
#import "CFRegistView.h"
#import "CFGetPasswordView.h"
#import "CFLTView.h"

@implementation CFLogIn
#pragma mark - 便利初始化
- (instancetype) initWithSuperView:(UIView *) aSuperView
{
    if (nil == aSuperView) {
        return nil;
    }
    
    if (self = [super init]) {
        self.superView = aSuperView;
        
        NSMutableDictionary * tempInfoOfUsers = [[NSMutableDictionary alloc] initWithCapacity:42];
        self.infoOfUsers = tempInfoOfUsers;
        [tempInfoOfUsers release];
        
    }
    
    return self;
}

#pragma mark - 实例方法
- (void)setLoginView:(CFLoginView *)loginView
{
    [loginView retain];
    [_loginView release];
    _loginView = loginView;
    _loginView.superView = self.superView;
}

- (void)setRegistView:(CFRegistView *)registView
{
    [registView retain];
    [_registView release];
    _registView = registView;
    _registView.superView = self.superView;
}

- (void)setGetPasswordView:(CFGetPasswordView *)getPasswordView
{
    [getPasswordView retain];
    [_getPasswordView release];
    _getPasswordView = getPasswordView;
    _getPasswordView.superView = self.superView;
}

- (void) start
{
    [self.superView bringSubviewToFront:self.loginView];
}

- (void) didClickButtonAction: (UIButton *) aButton
{
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
    NSDictionary * info = [self.getPasswordView dictOfSubViews];
    
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
    
    // 转向登录界面
    [self.superView bringSubviewToFront:self.loginView];
    
}

- (void) didClickBackButtonAction:(UIButton *)aButton
{
    // 点击返回按钮,返回登录界面.
    [self.superView bringSubviewToFront:self.loginView];
}

- (void)didClickNewRegistButtonAction:(UIButton *)aButton
{
    // 点击"新人加入"按钮,前往注册页面
    [self.superView bringSubviewToFront: self.registView];
}
- (void) didClickRetrievePwdButtonAction: (UIButton *)aButton
{
    // 点击"找回密码按钮",前往找回密码页面
    [self.superView bringSubviewToFront: self.getPasswordView];
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
    
    // 判断是否是有效的邮箱地址
    NSString * regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isEmailAddress = [predicate evaluateWithObject:emailAddress];
    
    // 如果文本框输入的是有效的邮件地址,则给出提示后,自动跳转至"登录"页面;如果不是,给出提示后,则不做跳转
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"无效的电子邮件地址!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    if (isEmailAddress) {
        alertView.message = @"重置密码邮件已经发送您的邮箱!即将转到登录页面!";
        [alertView show];
        [self.superView bringSubviewToFront: self.loginView];
        return;
    }
    
    [alertView show];
}
-(void)dealloc
{
    self.superView = nil;
    self.loginView = nil;
    self.registView = nil;
    self.getPasswordView = nil;
    self.infoOfUsers = nil;
    
    [super dealloc];
}
@end
