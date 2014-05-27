2014.5.22
用视图UIView展示三张图:img01,img02,img03
2014.5.25
作业一：注册页面
1、使用UILabel、UITextField、UIButton、UIAlertView实现注册页面。†
2、点击任何UITextField的return键都能回收键盘†
3、密码和确认密码采用密文输入†
4、手机号的UITextField使用数字键盘†
5、邮箱的UITextField使用邮箱键盘†
6、点击注册按钮时进行是否注册成功的判断：
	(1)用户名、密码、确认密码的3个UITextField的文本均不能为空，才能认为注册成功†
	(2)密码和确认密码的UITextField的文本必须相同，才能认为注册成功†
	(3)如果注册成功，弹出提示框。†
	(4)如果注册失败，弹出提示框。(两种情况：两次输入的密码不一致；用户名或密码不能为空)†


作业二：找回密码页面
1、使用UITextField、UIButton、UIAlertView实现找回密码页面。
2、点击UITextField的return键能回收键盘
3、定义宏，设置正确的邮箱字符串，通过比较输入的字符串和宏定义的邮箱字符串是否相等，完成找回密码是否成功的判断。
4、找回成功和失败均显示提示框，并且回收键盘

2014.5.26
作业需求：
1、程序运行后的主页面展示登陆页面
2、封装LoginView、RegistView、GetPasswordView
3、封装LTView
4、点击不同的按钮，实现页面切换