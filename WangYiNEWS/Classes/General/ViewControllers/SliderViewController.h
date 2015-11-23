//
//  SliderViewController.h
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUNSlideSwitchView.h"
#import "SliderTVController.h"

@interface SliderViewController : UIViewController

@property (nonatomic ,retain) SUNSlideSwitchView *slideSwitchView;

@property (nonatomic ,retain) SliderTVController * homeVC0;
@property (nonatomic ,retain) SliderTVController * homeVC1;
@property (nonatomic ,retain) SliderTVController * homeVC2;
@property (nonatomic ,retain) SliderTVController * homeVC3;
@property (nonatomic ,retain) SliderTVController * homeVC4;
@property (nonatomic ,retain) SliderTVController * homeVC5;

@end
