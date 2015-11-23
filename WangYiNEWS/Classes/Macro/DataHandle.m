//
//  DataHandle.m
//  豆瓣
//
//  Created by lanou3g on 15/10/28.
//  Copyright © 2015年 李乐凯. All rights reserved.
//

#import "DataHandle.h"

@implementation DataHandle

static DataHandle *dataHandle = nil;

+ (DataHandle *)creatDataHandle{
    if (dataHandle == nil) {
        dataHandle = [[DataHandle alloc] init];
    }
    return dataHandle;
}

@end
