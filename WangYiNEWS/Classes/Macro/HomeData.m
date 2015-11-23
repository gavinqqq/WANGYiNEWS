//
//  HomeData.m
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "HomeData.h"
#import "HomeModel.h"
#import "DetailModel.h"

static HomeData * homeData = nil;
@interface HomeData()
////承接解析字典的数组
//@property (nonatomic ,retain) NSArray * array ;



@end

@implementation HomeData
+ (HomeData *)shareHomeData{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        homeData = [HomeData new];
    });
    return homeData;
}

- (void)dataWithURL:(NSString *)url block:(Updata)block{
dispatch_async(dispatch_get_global_queue(0, 0), ^{
    NSURL * url1 = [NSURL URLWithString:url];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:url1];
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        NSArray * array = nil;
        if ([url isEqualToString:kHomeURLs]) {
            array = dic[@"T1348647853363"];
            // NSLog(@"%@",array);
        }else if ([url isEqualToString:kAmusementURLs]){
            array = dic[@"T1348648517839"];
            
        }else if ([url isEqualToString:kSportURLs]){
            array = dic[@"T1348649079062"];
            // NSLog(@"%@",array);
        }else if ([url isEqualToString:kScienceURLs]){
            array = dic[@"T1348649580692"];
            // NSLog(@"%@",array);
        }else if ([url isEqualToString:kFinanceURLs]){
            array = dic[@"T1348648756099"];
            // NSLog(@"%@",array);
        }else if ([url isEqualToString:kWorldURLs]){
            array = dic[@"T1348648037603"];
            // NSLog(@"%@",array);
        }

        self.allNews = [NSMutableArray arrayWithCapacity:5];
        for (NSDictionary * dic in array) {
            HomeModel  * model = [HomeModel new];
            [model setValuesForKeysWithDictionary:dic];
            [self.allNews addObject:model];
           // NSLog(@"-------------%@",self.allNews);
        }
        
        NSDictionary *dict =array[0];
        NSArray *array1 = dict[@"ads"];
        self.headerNews =[NSMutableArray arrayWithCapacity:5];
        for (NSDictionary *dict in array1) {
            HomeModel * model1 =[HomeModel new];
            [model1 setValuesForKeysWithDictionary:dict];
            [self.headerNews addObject:model1];
           // NSLog(@"#############%@",self.headerNews);
        }
      dispatch_async(dispatch_get_main_queue(), ^{
            if (!block) {
                NSLog(@"block,没代码");
            }else{
                block();
            }
        });
      
    }];
    [task resume];
});
    
}
//详情页面解析
- (void)dataWithURL:(NSString *)url str:(NSString *)str callBack:(MyBlock)callback{
    NSLog(@"%@",url);
   
        NSURL * url1 = [NSURL URLWithString:url];
        NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:url1];
        NSURLSession * session = [NSURLSession sharedSession];
        NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                   NSDictionary *dic1 = dic[str];//B8UQPMHE00014JB6
                    self.detailNews =[NSMutableArray arrayWithCapacity:5];
                      DetailModel * model2 =[DetailModel new];
                        [model2 setValuesForKeysWithDictionary:dic1];
                        [self.detailNews addObject:model2];
            
                    dispatch_async(dispatch_get_main_queue(), ^{
                        callback(model2);
                    });
            
            
         }];
    
  
    
        [task resume];
    
}

#pragma mark -----lazy load
-(NSMutableArray *)detailNews{
    if (!_detailNews) {
        _detailNews = [NSMutableArray array];
    }
    return  _detailNews;
}

- (NSMutableArray *)allNews{
    if (!_allNews) {
        _allNews = [NSMutableArray array];
        
    }
    return _allNews;
}

- (NSMutableArray *)headerNews{
    if (!_headerNews) {
        _headerNews =[NSMutableArray array];
        
    }
    return _headerNews;
}

@end
