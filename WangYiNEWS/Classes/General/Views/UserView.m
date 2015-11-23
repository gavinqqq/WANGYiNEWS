//
//  UserView.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "UserView.h"

@implementation UserView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews{

    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 80, 40)];
    lb1.textAlignment = NSTextAlignmentCenter;
    lb1.text = @"用户名";
    [self addSubview:lb1];
    
    UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(lb1.frame.origin.x, CGRectGetMaxY(lb1.frame)+20, lb1.frame.size.width , lb1.frame.size.height)];
    lb2.textAlignment = NSTextAlignmentCenter;
    lb2.text = @"密码";
    [self addSubview:lb2];
    
    UITextField *field1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 200, lb1.frame.size.height)];
    field1.placeholder = @"请输入用户名";
    field1.borderStyle = UITextBorderStyleRoundedRect;
    field1.tag =1000;
    
    [self addSubview:field1];
    
    UITextField *field2 = [[UITextField alloc] initWithFrame:CGRectMake(field1.frame.origin.x, CGRectGetMaxY(field1.frame)+20, field1.frame.size.width, lb1.frame.size.height)];
    field2.placeholder = @"请输入密码";
    field2.secureTextEntry = YES;
    field2.borderStyle = UITextBorderStyleRoundedRect;
    field2.tag = 1001;
    [self addSubview:field2];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button1.frame = CGRectMake(lb1.frame.origin.x, CGRectGetMaxY(field2.frame)+50, 80, 30);
    //self.button1.backgroundColor = [UIColor greenColor];
    [self.button1 setTitle:@"登陆" forState:UIControlStateNormal];
    self.button1.layer.cornerRadius = 5;
    [self addSubview:self.button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button2.frame = CGRectMake(CGRectGetMaxX(self.button1.frame)+10, CGRectGetMaxY(field2.frame)+50, 80, 30);
    //self.button2.backgroundColor = [UIColor greenColor];
    [self.button2 setTitle:@"注册" forState:UIControlStateNormal];
    self.button2.layer.cornerRadius = 5;
    [self addSubview:self.button2];
 

}

@end
