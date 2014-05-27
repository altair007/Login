//
//  CFAppDelegate.h
//  Login
//
//  Created by   颜风 on 14-5-22.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFLogIn.h"

@interface CFAppDelegate : UIResponder <UIApplicationDelegate, UITextFieldDelegate>
@property (retain, nonatomic) UIWindow * window;

#pragma mark - 实例方法
/**
 *  释放实例对象
 */
-(void)dealloc;
@end
