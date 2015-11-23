//
//  SliderTVController.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "SliderTVController.h"
#import "HomeModel.h"
#import "DetailSliderCell.h"
#import "HomeData.h"
#import "DetailViewController.h"
#import "MJRefresh.h"
static NSString * cellIdentifier1 = @"DetailSliderCell";

@interface SliderTVController ()

@end

@implementation SliderTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   [self.tableView registerNib:[UINib nibWithNibName:@"DetailSliderCell" bundle:nil] forCellReuseIdentifier:cellIdentifier1];
    
   self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(updateHeard)];
}
//下拉刷新实现方法
-(void)updateHeard{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSLog(@"%ld",[HomeData shareHomeData].allNews.count);
    return [HomeData shareHomeData]. allNews.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   DetailSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1 forIndexPath:indexPath];
    if (indexPath.row < [HomeData shareHomeData].allNews.count) {
        HomeModel * homeModel = [HomeData shareHomeData].allNews[indexPath.row];
        cell.homeModel = homeModel;
        
       // NSLog(@"-------%@",homeModel);
    }else{
        NSLog(@" 失败========== %ld ============= %ld", indexPath.section, indexPath.row);
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController * detailVC = [DetailViewController sharedHanderVC];
    [self showDetailViewController:detailVC sender:nil];
    HomeModel * model =[HomeData shareHomeData].allNews[indexPath.row];
    NSString * str = model.docid;
    //NSLog(@"%@",str);
    NSString *url =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html", str];
    [[HomeData shareHomeData] dataWithURL:url str:str callBack:^(DetailModel *model) {
        detailVC.model = model;
    }];
   
}



@end
