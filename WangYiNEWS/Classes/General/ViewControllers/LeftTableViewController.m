//
//  LeftTableViewController.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "LeftTableViewController.h"
#import "LeftViewCell.h"
#import "UMSocial.h"

@interface LeftTableViewController ()

@end

@implementation LeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    headView.backgroundColor = [UIColor blackColor];
    UIButton *butten = [UIButton buttonWithType:(UIButtonTypeSystem)];
    butten.frame = CGRectMake(10, 10, 80, 80);
    butten.layer.masksToBounds =YES;
    butten.layer.cornerRadius = 40 ;
    butten.backgroundColor = [UIColor redColor];
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button1.frame = CGRectMake(110, 35, 100, 30);
    [button1 setTitle:@"我的账号" forState:(UIControlStateNormal)];
    [butten setImage:[UIImage imageNamed:@"ceshi.JPG"] forState:(UIControlStateNormal)];
    [butten addTarget:self action:@selector(londing) forControlEvents:(UIControlEventTouchUpInside)];
    [button1 addTarget:self action:@selector(londing) forControlEvents:(UIControlEventTouchUpInside)];
    
    [headView addSubview:butten];
    [headView addSubview:button1];
    
    self.tableView.tableHeaderView = headView;
    

    [self.tableView registerNib:[UINib nibWithNibName:@"LeftViewCell" bundle:nil] forCellReuseIdentifier:@"LeftCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)londing{
   
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   LeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCell" forIndexPath:indexPath];
    
    NSArray * Labarray = @[@"我的收藏",@"设置",@"离线模式",@"我的评论",@"新闻搜索",@"版本信息",@"我要反馈"];
    cell.img4pic.layer.masksToBounds =YES;
    cell.img4pic.layer.cornerRadius = 104;
   
    cell.lab4title.text = Labarray[indexPath.row];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
