//
//  CFLogInViewController.h
//  Login
//
//  Created by   颜风 on 14-5-27.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CFLoginView;
@class CFRegistView;
@class CFGetPasswordView;

@interface CFLogInViewController : UIViewController
@property (retain, nonatomic) CFLoginView * loginView; //!< 登陆页面
@property (retain, nonatomic) CFRegistView * registView; //!< 注册页面
@property (retain, nonatomic) CFGetPasswordView * getPasswordView; //!< 找回密码页面
@property (retain, nonatomic) NSMutableDictionary * infoOfUsers; //!< 存储正确的用户名和密码.

#pragma mark - 工具方法
/**
 *  回收键盘
 */
- (void) recycleKeyboard;

/**
 *  清空页面文本编辑框的内容
 */
- (void) emptyTextField;
@end
