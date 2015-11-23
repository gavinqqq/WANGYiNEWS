//
//  DetailViewController.h
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"
@interface DetailViewController : UIViewController

@property (nonatomic ,retain) DetailModel * model;

+ (instancetype)sharedHanderVC;

@end
