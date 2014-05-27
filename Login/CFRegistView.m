//
//  CFRegistView.m
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFRegistView.h"
#import "CFLTView.h"

@implementation CFRegistView
- (NSDictionary *)defaultViews
{
    // 获取本视图控件信息
    NSDictionary * dict = [super defaultViews];
    
    // 个性化设置
    // 密码和确认密码采用密文输入
    CFLTView * pwdLTView = [dict objectForKey: @"密码"];
    CFLTView * confirmLTView = [dict objectForKey: @"确认密码"];
    pwdLTView.textField.secureTextEntry = YES;
    confirmLTView.textField.secureTextEntry = YES;
    
    // 手机号的UITextField使用数字键盘
    CFLTView * phoneLTView = [dict objectForKey:@"手机号"];
    phoneLTView.textField.keyboardType = UIKeyboardTypeNumberPad;
    
    // 邮箱的UITextField使用邮箱键盘
    CFLTView * mailLTView = [dict objectForKey:@"邮箱"];
    mailLTView.textField.keyboardType = UIKeyboardTypeEmailAddress;
    
    return dict;
}
@end
