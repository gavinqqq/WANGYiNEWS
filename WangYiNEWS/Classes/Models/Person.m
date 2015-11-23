//
//  Person.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (instancetype)initWithName:(NSString *)name passWord:(NSString *)passWord mailbox:(NSString *)mailbox contacWay:(NSString *)contacWay{
    if ([super init]) {
        _name = name;
        _passWord = passWord;
        _mailbox = mailbox;
        _contactWay = contacWay;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@", _name];
}


@end
