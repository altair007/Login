//
//  CFLoginBase.h
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFLoginBase : UIView
#pragma mark - 属性
@property (retain, nonatomic) NSDictionary * dictOfSubViews;//!< 子视图字典
@property (retain, nonatomic) id delegate; //!< 代理
@property (retain, nonatomic, readonly) NSArray * infoOfLables; //!< 存储标签控件文本的数组.
@property (retain, nonatomic, readonly) NSArray * infoOfButtons; //!< 存储按钮文本的数组.

#pragma mark - 初始化
/**
 *  便利初始化
 *
 *  @param frame     框架信息
 *  @param aDelegate 代理
 *  @param aView     父类视图
 *  @param infoOfLabels   存储标签控件文本的数组
 *  @param infoOfButtons    存储按钮文本的数组
 *
 *  @return 初始化后的对象
 */
- (instancetype) initWithFrame: (CGRect)frame
                      delegate: (id) aDelegate
                  infoOfLables: (NSArray *) infoOfLabels
                 infoOfButtons: (NSArray *) infoOfButtons;

#pragma mark - 实例方法
/**
 *  用于生成默认的属性
 *
 *  此方法在初始化时自动调用.子类可以重载此方法.
 *
 *  @param rectOfSelfView 实例属性selfView的frame.
 *
 *  @return 存储子视图信息的字典.
 */
- (NSDictionary * )defaultViews;

@end
