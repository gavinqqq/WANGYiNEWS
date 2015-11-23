//
//  EnrollView.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "EnrollView.h"

@implementation EnrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllViews];
    }
    return self;
}

-(void)addAllViews{
    
    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 80, 40)];
    lb1.textAlignment = NSTextAlignmentCenter;
    lb1.text = @"用户名";
    [self addSubview:lb1];
    
    UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(lb1.frame.origin.x, CGRectGetMaxY(lb1.frame)+20, lb1.frame.size.width , lb1.frame.size.height)];
    lb2.textAlignment = NSTextAlignmentCenter;
    lb2.text = @"密码";
    [self addSubview:lb2];
    
    UILabel *lb3 = [[UILabel alloc] initWithFrame:CGRectMake(lb2.frame.origin.x, CGRectGetMaxY(lb2.frame)+20, lb2.frame.size.width , lb2.frame.size.height)];
    lb3.textAlignment = NSTextAlignmentCenter;
    lb3.text = @"确认密码";
    [self addSubview:lb3];
    
    UILabel *lb4 = [[UILabel alloc] initWithFrame:CGRectMake(lb3.frame.origin.x, CGRectGetMaxY(lb3.frame)+20, lb3.frame.size.width , lb3.frame.size.height)];
    lb4.textAlignment = NSTextAlignmentCenter;
    lb4.text = @"手机号";
    [self addSubview:lb4];
    
    UILabel *lb5 = [[UILabel alloc] initWithFrame:CGRectMake(lb4.frame.origin.x, CGRectGetMaxY(lb4.frame)+20, lb4.frame.size.width , lb4.frame.size.height)];
    lb5.textAlignment = NSTextAlignmentCenter;
    lb5.text = @"邮箱";
    [self addSubview:lb5];
    
    UITextField *field1 = [[UITextField alloc] initWithFrame:CGRectMake(150, 100, 200, lb1.frame.size.height)];
    field1.placeholder = @"请输入用户名";
    field1.tag = 1003;
    field1.delegate = self;
    field1.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:field1];
    
    UITextField *field2 = [[UITextField alloc] initWithFrame:CGRectMake(field1.frame.origin.x, CGRectGetMaxY(field1.frame)+20, field1.frame.size.width, lb1.frame.size.height)];
    field2.placeholder = @"请输入密码";
    field2.secureTextEntry = YES;
    field2.tag = 1004;
    field2.delegate = self;
    field2.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:field2];
    
    UITextField *field3 = [[UITextField alloc] initWithFrame:CGRectMake(field2.frame.origin.x, CGRectGetMaxY(field2.frame)+20, field2.frame.size.width, lb1.frame.size.height)];
    field3.placeholder = @"请再次输入密码";
    field3.tag = 1005;
    field3.delegate = self;
    field3.secureTextEntry = YES;
    field3.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:field3];
    
    UITextField *field4 = [[UITextField alloc] initWithFrame:CGRectMake(field3.frame.origin.x, CGRectGetMaxY(field3.frame)+20, field3.frame.size.width, lb3.frame.size.height)];
    field4.tag = 1006;
    field4.placeholder = @"请输入手机号";
    field4.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:field4];
    
    UITextField *field5 = [[UITextField alloc] initWithFrame:CGRectMake(field4.frame.origin.x, CGRectGetMaxY(field4.frame)+20, field4.frame.size.width, lb4.frame.size.height)];
    field5.tag =1007;
    field5.placeholder = @"请输入邮箱";
    field5.secureTextEntry = YES;
    field5.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:field5];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button1.frame = CGRectMake(lb1.frame.origin.x+20, CGRectGetMaxY(lb5.frame)+20, 80, 30);
    self.button1.backgroundColor = [UIColor greenColor];
    [self.button1 setTitle:@"注册" forState:UIControlStateNormal];
    self.button1.layer.cornerRadius = 5;
    
    [self addSubview:self.button1];
    
    

    
}

@end
