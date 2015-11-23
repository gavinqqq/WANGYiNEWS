//
//  DetailModel.h
//  WangYiNEWS
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

//@property (nonatomic ,retain) NSString * digest ;
@property (nonatomic ,retain) NSString * dkeys ;
@property (nonatomic ,retain) NSArray * imgArray ;
@property (nonatomic ,retain) NSString * source ;
@property (nonatomic ,retain) NSString * title ;
@property (nonatomic ,retain) NSString * body ;

@property (nonatomic ,retain) DetailModel *detailModel;



@end
