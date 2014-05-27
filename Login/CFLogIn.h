//
//  CFLogIn.h
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CFLoginView;
@class CFRegistView;
@class CFGetPasswordView;

/**
 *  登陆管理
 */
@interface CFLogIn : NSObject
#pragma mark - 属性
@property (retain, nonatomic) UIView * superView; //!< 页面的父视图
@property (retain, nonatomic) CFLoginView * loginView; //!< 登陆页面
@property (retain, nonatomic) CFRegistView * registView; //!< 注册页面
@property (retain, nonatomic) CFGetPasswordView * getPasswordView; //!< 找回密码页面
@property (retain, nonatomic) NSMutableDictionary * infoOfUsers; //!< 存储正确的用户名和密码.

#pragma mark - 便利初始化
/**
 *  便利初始化.初始化后,还需要设置三个子视图.
 *
 *  @param aSuperView       此类下所有视图的父视图
 *
 *  @return 初始化后的对象.
 */
- (instancetype) initWithSuperView:(UIView *) aSuperView;

#pragma mark - 实例方法
/**
 *  开始登陆
 */
- (void) start;

/**
 *  响应点击注册按钮事件
 *
 *  根据事件的不同,做出不同的响应.
 *
 *  @param aButton 被点击的按钮.
 */
- (void) didClickButtonAction: (UIButton *) aButton;

/**
 *  释放实例变量
 */
-(void)dealloc;
@end
