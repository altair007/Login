//
//  CFAppDelegate.h
//  Login
//
//  Created by   颜风 on 14-5-22.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>
#define EMAIL @"1178328901@qq.com"

@interface CFAppDelegate : UIResponder <UIApplicationDelegate, UITextFieldDelegate>
@property (retain, nonatomic) UIWindow *window;
@property (retain, nonatomic) NSMutableDictionary * textFieldsOfSignIn; //!< 存储注册页面的文本框.
@property (retain, nonatomic) UITextField * emailField; //!< 找回密码页面的文本框.
@end
