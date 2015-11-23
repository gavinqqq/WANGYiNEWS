//
//  DetailViewController.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DetailViewController.h"
#import "HomeData.h"
#import "UIImageView+WebCache.h"
#import "DetailModel.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *web4View;


@property (weak, nonatomic) IBOutlet UILabel *lable4Title;
@property (weak, nonatomic) IBOutlet UIImageView *img4pic;
//@property (weak, nonatomic) IBOutlet UILabel *lable4detail;

@end

static DetailViewController * detailVC =nil;

//static NSString *cellIdentifier =@"cell";

@implementation DetailViewController

- (void)setModel:(DetailModel *)model{
    _model =model;
    NSLog(@"%@",model.imgArray);
    [_img4pic sd_setImageWithURL:[NSURL URLWithString:[model.imgArray lastObject][@"src"]]placeholderImage:[UIImage imageNamed:@"image_loading@2x.png"]];
    _lable4Title.text = model.title;
    //_lable4detail.text =model.body;
    
   [_web4View loadHTMLString:model.body baseURL:nil];
}

+ (instancetype)sharedHanderVC{
    
    UIStoryboard * sb =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    detailVC =[sb instantiateViewControllerWithIdentifier:@"detailVC"];
    
    return detailVC;

}

- (void)viewDidLoad {
    [super viewDidLoad];



}
- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
