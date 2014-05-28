//
//  CFLoginBaseView.h
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFLoginBaseView.h"
#import "CFLTView.h"
#import "CFLogInViewController.h"

@interface CFLoginBaseView ()
@property (retain, nonatomic, readwrite) NSArray * infoOfLables;
@property (retain, nonatomic, readwrite) NSArray * infoOfButtons;
@end

@implementation CFLoginBaseView
#pragma mark - 初始化
- (instancetype) initWithFrame: (CGRect)frame
                      delegate: (id) aDelegate
                  infoOfLables: (NSArray *) infoOfLables
                 infoOfButtons: (NSArray *) infoOfButtons
{
    if (nil == aDelegate ||
        nil == infoOfButtons || nil == infoOfButtons) {
        return nil;
    }
    
    if (self = [super initWithFrame:frame]) {
        // 设置默认白色背景色
        self.backgroundColor = [UIColor whiteColor];
        
        // 代理初始化
        self.delegate = aDelegate;
        
        self.infoOfLables = infoOfLables;
        self.infoOfButtons = infoOfButtons;
        
        // 子视图的初始化
        self.dictOfSubViews = [self defaultViews];
        
        if (nil == self.dictOfSubViews) {
            return  nil;
        }
        
        [self.dictOfSubViews enumerateKeysAndObjectsUsingBlock:^(id key, UIView * obj, BOOL *stop) {
            [self addSubview:obj];
        }];
    }
    return self;
}

#pragma mark -重写方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 回收键盘
    [self.dictOfSubViews enumerateKeysAndObjectsUsingBlock:^(id key, CFLTView * obj, BOOL *stop) {
        if ([obj isKindOfClass:[CFLTView class]]) {
            [obj.textField resignFirstResponder];
        }
    }];
}

#pragma mark - 实例方法
- (NSDictionary * )defaultViews{
    // 存储视图信息
    NSMutableDictionary * dictOfViews;
    dictOfViews = [[NSMutableDictionary alloc] initWithCapacity:42];
    
    // 各分栏视图
    __block CGRect baseRect = CGRectMake(self.frame.size.width * 0.1, self.frame.size.height * 0.1, self.frame.size.width - self.frame.size.width * 0.2, self.frame.size.height * 0.05);
    
    // 步进值
    CGFloat step =  baseRect.size.height*1.5;
    
    [self.infoOfLables enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL *stop) {
        CFLTView * ltView = [[CFLTView alloc] initWithFrame:baseRect];
        ltView.label.text = obj;
        ltView.label.adjustsFontSizeToFitWidth = YES;
        [dictOfViews setObject:ltView forKey:ltView.label.text];
        baseRect = CGRectMake(baseRect.origin.x, baseRect.origin.y + step, baseRect.size.width, baseRect.size.height);
        
        [ltView release];
    }];
    
    // 按钮: 登录 找回密码 注册
    NSInteger spaceOfButtons = baseRect.size.width*0.08;
    __block CGRect baseRectOfButtons = CGRectMake(baseRect.origin.x, baseRect.origin.y + baseRect.size.height, (baseRect.size.width - (self.infoOfButtons.count - 1) * spaceOfButtons)/self.infoOfButtons.count, baseRect.size.height);
    
    [self.infoOfButtons enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL *stop) {
        UIButton * tempButton;
        tempButton = [UIButton buttonWithType:UIButtonTypeSystem];
        tempButton.frame = baseRectOfButtons;
        [tempButton setTitle:obj forState:UIControlStateNormal];
        [tempButton addTarget:self.delegate action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [dictOfViews setObject:tempButton forKey:[tempButton titleForState:UIControlStateNormal]];
        
        baseRectOfButtons = CGRectMake(baseRectOfButtons.origin.x + baseRectOfButtons.size.width + spaceOfButtons, baseRectOfButtons.origin.y, baseRectOfButtons.size.width, baseRectOfButtons.size.height);
    }];
    
    // 返回结果
    NSDictionary * result;
    
    result = [[[NSDictionary alloc] initWithDictionary:dictOfViews] autorelease];
    
    [dictOfViews release];
    
    return result;
}

-(void)dealloc
{
    self.dictOfSubViews = nil;
    self.delegate = nil;
    self.infoOfLables = nil;
    self.infoOfButtons = nil;
    
    [super dealloc];
}
@end
