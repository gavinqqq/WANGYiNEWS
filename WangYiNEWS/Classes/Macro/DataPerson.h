//
//  DataPerson.h
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface DataPerson : NSObject

+ (DataPerson *)shareDataNase;

- (void)openDB;

- (void)closeDB;
// 增加
- (void)addPerson:(Person *)person;

//// 查找一条新闻
- (Person *)selectPersonWithName:(NSString *)name;

- (void)openDBOfMovie;
- (void)closeDBOfMovie;
- (void)addTitle:(NSString *)title name:(NSString *)name;
- (NSArray *)selectAllTitleWithName:(NSString *)name;

- (void)openDBOfActivity;
- (void)closeDBOfActivity;
- (void)addTitle1:(NSString *)title name:(NSString *)name;
- (NSArray *)selectAllTitle1WithName:(NSString *)name;

@end
