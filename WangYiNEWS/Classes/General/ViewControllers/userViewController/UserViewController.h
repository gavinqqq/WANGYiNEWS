//
//  UserViewController.h
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserView.h"

@protocol UserViewDelegate <NSObject>

- (void)passValue:(NSString *)string;

@end

@interface UserViewController : UIViewController

@property (nonatomic ,assign) id<UserViewDelegate> delegate ;

@property (nonatomic ,retain) UserView * userView ;

@end
