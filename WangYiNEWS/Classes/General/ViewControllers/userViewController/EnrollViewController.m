//
//  EnrollViewController.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "EnrollViewController.h"

@interface EnrollViewController ()<UITextFieldDelegate>

@end

@implementation EnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enrollView =[[EnrollView alloc]initWithFrame:self.view.frame];
    self.view =_enrollView;
    _enrollView.backgroundColor =[UIColor whiteColor];
    
    [self.enrollView.button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 注册

-(void)button1Action:(UIButton *)sender{
    UITextField *tf1 = (UITextField *)[self.view viewWithTag:1003];
    NSString * st1 = tf1.text;
    
    UITextField *tf2 = (UITextField *)[self.view viewWithTag:1004];
    NSString * st2 =tf2.text;
    
    UITextField *tf3 = (UITextField *)[self.view viewWithTag:1005];
    NSString *st3 =tf3.text;
    UITextField *tf4 = (UITextField *)[self.view viewWithTag:1006];
    NSString *st4 =tf4.text;
    UITextField *tf5 = (UITextField *)[self.view viewWithTag:1007];
    NSString *st5 =tf5.text;
    if ([st1 isEqualToString:@""] || [st2 isEqualToString:st3] == 0 || [st5 isEqualToString:@""] || [st2 isEqualToString:@""]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入不能为空"preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
        [alert addAction:alertA];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        Person *person = [[Person alloc] initWithName:st1 passWord:st2 mailbox:st3 contacWay:st4];
        DataPerson *dataBase = [DataPerson shareDataNase];
        [dataBase addPerson:person];
    }
    

}
//-(void)button2Action:(UIButton *)sender{
//    [self.enrollView removeFromSuperview];
//    
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_enrollView endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
