//
//  CFLTView.h
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  含有一个文本和文本框的组合
 */
@interface CFLTView : UIView <UITextFieldDelegate>
#pragma mark - 属性
@property (retain, nonatomic) UILabel * label; //!< 文本标签
@property (retain, nonatomic) UITextField * textField; //!< 文本框
@end
