//
//  CFLoginView.m
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFLoginView.h"
#import "CFLTView.h"

@implementation CFLoginView
-(NSDictionary *)defaultViews
{
    // 获取本视图控件信息
    NSDictionary * dict = [super defaultViews];
    
    // 个性化设置
    // 密码和确认密码采用密文输入
    CFLTView * pwdLTView = [dict objectForKey: @"密码"];;
    pwdLTView.textField.secureTextEntry = YES;
    
    return dict;
}

@end
