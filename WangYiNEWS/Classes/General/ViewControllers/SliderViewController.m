//
//  SliderViewController.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "SliderViewController.h"
#import "HomeData.h"
#import "HomeModel.h"
#import "UserViewController.h"

@interface SliderViewController ()<SUNSlideSwitchViewDelegate,UIScrollViewDelegate>

@property (nonatomic ,retain) UIScrollView *scrollView;

@property (nonatomic ,retain) UIPageControl *page;

@property (nonatomic ,retain) NSTimer *timer;

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.slideSwitchView = [[SUNSlideSwitchView alloc]initWithFrame:self.view.frame];
    
    _slideSwitchView.slideSwitchViewDelegate = self;
    
    [self.view addSubview:self.slideSwitchView];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout =UIRectEdgeNone;
    }
    
    self.slideSwitchView.tabItemNormalColor =[UIColor blackColor];
    self.slideSwitchView.tabItemSelectedColor =[UIColor redColor];
    self.slideSwitchView.shadowImage =[[UIImage imageNamed:@"red_line_and_shadow.png"]stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
    
    self.homeVC0 =[[SliderTVController alloc]init];
    self.homeVC0.title =@"首页";
    
    self.homeVC1 =[[SliderTVController alloc]init];
    self.homeVC1.title =@"娱乐";
    
    self.homeVC2 =[[SliderTVController alloc]init];
    self.homeVC2.title =@"体育";
    
    self.homeVC3 =[[SliderTVController alloc]init];
    self.homeVC3.title =@"科技";
    
    self.homeVC4 =[[SliderTVController alloc]init];
    self.homeVC4.title =@"财经";
    
    self.homeVC5 =[[SliderTVController alloc]init];
    self.homeVC5.title =@"社会";
    [self.slideSwitchView buildUI];
}

#pragma mark--delegate

- (NSUInteger)numberOfTab:(SUNSlideSwitchView *)view{

    return 6;
}

- (UIViewController *)slideSwitchView:(SUNSlideSwitchView *)view viewOfTab:(NSUInteger)number{
    if (number == 0) {
        return  self.homeVC0;
    }else if (number == 1){
        return self.homeVC1;
    }else if (number == 2){
        return self.homeVC2;
    }else if (number == 3){
        return self.homeVC3;
    }else if (number == 4){
        return self.homeVC4;
    }else {
        return self.homeVC5;
    }
    
}

- (void)slideSwitchView:(SUNSlideSwitchView *)view didselectTab:(NSUInteger)number{
    SliderTVController * VC =nil;
    
    if (number ==0) {
        VC = self.homeVC0;
        [self dataWithVC:VC URL:kHomeURLs];
        [self dataTopScrollWithVC:VC URL:kHomeURLs];
       
    }else if (number == 1){
         VC = self.homeVC1;
        [self dataWithVC:VC URL:kAmusementURLs];
        [self dataTopScrollWithVC:VC URL:kAmusementURLs];
        
    }else if (number == 2){
         VC = self.homeVC2;
        [self dataWithVC:VC URL:kSportURLs];
        [self dataTopScrollWithVC:VC URL:kSportURLs];
        
    }else if (number == 3){
         VC = self.homeVC3;
        [self dataWithVC:VC URL:kScienceURLs];
        [self dataTopScrollWithVC:VC URL:kScienceURLs];
        
    }else if (number == 4){
         VC = self.homeVC4;
        [self dataWithVC:VC URL:kFinanceURLs];
        [self dataTopScrollWithVC:VC URL:kFinanceURLs];
        
    }else if (number == 5){
         VC = self.homeVC5;
        [self dataWithVC:VC URL:kWorldURLs];
         [self dataTopScrollWithVC:VC URL:kWorldURLs];
    }
}







//传值方法的调用
- (void)dataWithVC:(SliderTVController *)homeTVC URL:(NSString *)url{
    
    //删除上次数据
   [[HomeData shareHomeData]dataWithURL:url block:^(){
       //NSLog(@"%@",[HomeData shareHomeData].allNews);
       if ([HomeData shareHomeData].allNews.count) {
           [[HomeData shareHomeData].allNews removeLastObject];
       }

       [homeTVC.tableView reloadData];
  }];
    

}
- (void)dataTopScrollWithVC:(SliderTVController *)homeTVC URL:(NSString *)  url{
    if (self.timer) {
        [self.timer invalidate];
        self.timer =nil;
    }
    if ([HomeData shareHomeData].headerNews) {
        [[HomeData shareHomeData].headerNews removeAllObjects];
    }
    [[HomeData shareHomeData]dataWithURL:url block:^(){
        
    [self topScrollViewWithVC:homeTVC];
    [homeTVC.tableView reloadData];
    }];
}
- (IBAction)button4user:(id)sender {
    UserViewController * userVC = [[UserViewController alloc]init];
    [self.navigationController pushViewController:userVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//轮播图
- (void)topScrollViewWithVC:(SliderTVController *)homeTVC{
    
    
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    homeTVC.tableView.tableHeaderView = aView;

    NSInteger current = [HomeData shareHomeData].headerNews.count ;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*current, 200);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [aView addSubview:scrollView];
    
    for (int i =0; i<current; i++) {
        HomeModel * model =[HomeData shareHomeData].headerNews[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]placeholderImage:[UIImage imageNamed:@"image_loading@2x"]];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0 , 170, [UIScreen mainScreen].bounds.size.width, 30)];
        label.text = [NSString stringWithFormat:@"    %@",model.title];
        label.backgroundColor = [UIColor blackColor];
        label.alpha = 0.7;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:13];
        [imageView addSubview:label];
        
        [scrollView addSubview:imageView];
    }
    self.scrollView =scrollView;
    if (current > 1 ) {
        
        UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-100, 185, 150, 15)];
        page.numberOfPages = current;
        page.currentPageIndicatorTintColor = [UIColor redColor];
        page.pageIndicatorTintColor = [UIColor grayColor];
        [page addTarget:self action:@selector(pageClick:) forControlEvents:(UIControlEventValueChanged)];
        [aView addSubview:page];
        self.page = page;
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
     }
    
}
- (void)timeAction:(NSTimer *)sender{
    //当它为第几张时
    NSInteger a = _page.currentPage;
    a++;
    if ( a == [HomeData shareHomeData].headerNews.count) {
        a = 0;
    }
    _scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width*a, 0);
    _page.currentPage = a;
}

- (void)pageClick:(UIPageControl *)sender{
    _scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width*(sender.currentPage), 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _page.currentPage = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
}


@end
