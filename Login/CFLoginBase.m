//
//  CFLoginBase.m
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFLoginBase.h"
#import "CFLTView.h"
#import "CFLogIn.h"

@interface CFLoginBase ()
@property (retain, nonatomic, readwrite) NSArray * infoOfLables;
@property (retain, nonatomic, readwrite) NSArray * infoOfButtons;
@end

@implementation CFLoginBase
#pragma mark - 初始化
- (instancetype) initWithFrame: (CGRect)frame
                      delegate: (id) aDelegate
                     superView: (UIView *) aView
                  infoOfLables: (NSArray *) infoOfLables
                 infoOfButtons: (NSArray *) infoOfButtons
{
    if (nil == aView || nil == aDelegate ||
        nil == infoOfButtons || nil == infoOfButtons) {
        return nil;
    }
    
    if (self = [super initWithFrame:frame]) {
        // 父类属性初始化
        self.superView = aView;
        
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
        
        self.backgroundColor = [UIColor whiteColor];
        [self.superView addSubview: self];
    }
    
    return self;
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
        // !!!: 应该同时传入代理对象和方法名selector.
        [tempButton addTarget:self.delegate action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [dictOfViews setObject:tempButton forKey:[tempButton titleForState:UIControlStateNormal]];
        
        // !!!: 临时添加设置颜色!
        tempButton.backgroundColor = [UIColor blueColor];
        
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
