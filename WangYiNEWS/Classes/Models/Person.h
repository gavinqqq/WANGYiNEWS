//
//  Person.h
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Person : NSObject

// 用户名
@property (nonatomic, retain) NSString *name;
// 密码
@property (nonatomic, retain) NSString *passWord;
// 确认密码
//@property (nonatomic, retain) NSString *verifyPassWord;
// 邮箱
@property (nonatomic, retain) NSString *mailbox;
// 联系fs
@property (nonatomic, retain) NSString *contactWay;
@property (nonatomic, retain) NSArray *array;

- (instancetype)initWithName:(NSString *)name passWord:(NSString *)passWord mailbox:(NSString *)mailbox contacWay:(NSString *)contacWay;


@end
