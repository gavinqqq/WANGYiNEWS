//
//  HomeModel.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

//重写描述方法
- (NSString *)description{
    return [NSString stringWithFormat:@"%@",self.title];
}

@end
