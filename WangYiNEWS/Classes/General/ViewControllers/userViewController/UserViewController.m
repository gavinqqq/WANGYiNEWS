//
//  UserViewController.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "UserViewController.h"
#import "Person.h"
#import "EnrollViewController.h"
#import "DataPerson.h"
#import "DataHandle.h"
@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"用户登录";
    self.userView = [[UserView alloc]initWithFrame:self.view.frame];
    self.view = _userView;
    _userView.backgroundColor =[UIColor whiteColor];
    
//    //保存账户密码
//    NSUserDefaults * user =[NSUserDefaults standardUserDefaults];
//    [user setValue:@"123" forKey:@"1"];
//    [user setValue:@"1234" forKey:@"2"];
//    
    [self.userView.button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.userView.button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
   
}

#pragma mark--登陆

- (void)button1Action:(UIButton *)sender{
    Person *person = [Person new];
    DataPerson *dataBase = [DataPerson shareDataNase];
    
    UITextField *tf1 =(UITextField *)[self.view viewWithTag:150];
    NSString *st1 = tf1.text;
    UITextField *tf2 =(UITextField *)[self.view viewWithTag:151];
    NSString *st2 = tf2.text;
    person =[dataBase selectPersonWithName:st1];
    if ([person.passWord isEqualToString:st2]) {
        DataHandle *dataHandle = [DataHandle creatDataHandle];
        dataHandle.name = st1;
        [_delegate passValue:@"注销"];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        // 提示界面
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码或账号不对"preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
        [alert addAction:alertA];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}


#pragma mark 注册按钮
- (void)button2Action:(UIButton *)sender{
    EnrollViewController *enrollVC = [[EnrollViewController alloc] init];
    [self.navigationController pushViewController:enrollVC animated:YES];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_userView endEditing:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
