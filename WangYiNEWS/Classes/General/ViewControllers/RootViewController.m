//
//  RootViewController.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "RootViewController.h"
#import "SliderViewController.h"
#import "LeftTableViewController.h"
#import "NavViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maximumLeftDrawerWidth = [UIScreen mainScreen].bounds.size.width -200;
    //添加视图
    UIStoryboard * sb =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NavViewController * nav = [sb instantiateViewControllerWithIdentifier:@"nav"];
    
    
    LeftTableViewController * leftVC =[[LeftTableViewController alloc]init];
    
    self.centerViewController =nav ;
    self.leftDrawerViewController =leftVC;
    
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
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
