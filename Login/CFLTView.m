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
        self.label.backgroundColor = [UIColor redColor];
        [tempLabel release];
        
        CGRect rectOfTextField = CGRectMake(rectOfLabel.size.width, 0, self.frame.size.width - rectOfLabel.size.width, rectOfLabel.size.height);
        UITextField * tempTextField = [[UITextField alloc] initWithFrame:rectOfTextField];
        self.textField = tempTextField;
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
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

@end
