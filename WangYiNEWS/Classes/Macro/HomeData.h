//
//  HomeData.h
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailModel.h"
//typedef void (^UpdataUI)();
//传值
typedef void(^Updata)();

typedef void (^MyBlock)(DetailModel *model);

@interface HomeData : NSObject

//@property (nonatomic, copy) UpdataUI myUpdataUI;

@property (nonatomic ,copy) Updata  myUpdata ;
//热门数据
@property (nonatomic ,retain) NSMutableArray * allNews;
//轮播图数据
@property (nonatomic ,retain) NSMutableArray * headerNews;
//详情数据
@property (nonatomic ,retain) NSMutableArray * detailNews;



//刷新
+ (HomeData *)shareHomeData;
//解析方法
- (void)dataWithURL:(NSString *)url block:(Updata)block;
- (void)dataWithURL:(NSString *)url str:(NSString *)str callBack:(MyBlock)callback;
@end
