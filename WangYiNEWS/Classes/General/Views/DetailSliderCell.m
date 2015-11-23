//
//  DetailSliderCell.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DetailSliderCell.h"
#import "UIImageView+WebCache.h"

@interface DetailSliderCell()

@property (weak, nonatomic) IBOutlet UIImageView *img4Pic;
@property (weak, nonatomic) IBOutlet UILabel *lable4Title;
@property (weak, nonatomic) IBOutlet UILabel *lable4ediAndTime;
@property (weak, nonatomic) IBOutlet UILabel *label4RevCount;

@end

@implementation DetailSliderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHomeModel:(HomeModel *)homeModel{

    _homeModel =homeModel;
    [_img4Pic sd_setImageWithURL:[NSURL URLWithString:homeModel.imgsrc]
    placeholderImage:[UIImage imageNamed:@"image_loading@2x.png"]];
    _lable4Title.text = homeModel.title;
    _label4RevCount.text = homeModel.ptime;
    _lable4ediAndTime.text = homeModel.source;
   
  
}


@end
