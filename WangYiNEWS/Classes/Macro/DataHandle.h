//
//  DataHandle.h
//  豆瓣
//
//  Created by lanou3g on 15/10/28.
//  Copyright © 2015年 李乐凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHandle : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *title;

+ (DataHandle *)creatDataHandle;

@end
