//
//  CFLTView.m
//  Login
//
//  Created by   颜风 on 14-5-26.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFLTView.h"
@interface CFLTView ()
@property (assign, nonatomic, readwrite) UIView * superView;
@end

@implementation CFLTView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rectOfLabel = CGRectMake(0, 0, self.frame.size.width * 0.3, self.frame.size.height);
        UILabel * tempLabel = [[UILabel alloc] initWithFrame:rectOfLabel];
        self.label = tempLabel;
        [tempLabel release];
        
        CGRect rectOfTextField = CGRectMake(rectOfLabel.size.width, 0, self.frame.size.width - rectOfLabel.size.width, rectOfLabel.size.height);
        UITextField * tempTextField = [[UITextField alloc] initWithFrame:rectOfTextField];
        self.textField = tempTextField;
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        self.textField.delegate = self;
        [tempTextField release];
        
        [self addSubview:self.label];
        [self addSubview:self.textField];
    }
    return self;
}

- (void)dealloc
{
    self.label = nil;
    self.textField = nil;
    
    [super dealloc];
}

#pragma mark - 协议方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}
@end
