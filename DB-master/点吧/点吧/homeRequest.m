//
//  homeRequest.m
//  点吧
//
//  Created by Jerry on 2017/1/2.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "homeRequest.h"

@implementation homeRequest

+(void)GetWithRequest:(SuccessBlockData)successData failure:(FailureBlock)failureData
{
    [[NetworkRequest shareInstance]POST:@"http://www.kdiana.com/index.php/Before/HomePage/index" parameters:nil Success:^(id success) {
        
        homeModel * homeModelData = [[homeModel alloc]init];
        [homeModelData setValuesForKeysWithDictionary:success];
        
        NSMutableArray * homeInfoArr = [NSMutableArray array];
        NSMutableArray * homeImgArr = [NSMutableArray array];
        NSMutableArray * homeHotArr = [NSMutableArray array];
        
        //tableView
        for (NSDictionary *infoDic in homeModelData.info) {
            homeModel_info * homeModelInfo = [[homeModel_info alloc]init];
            [homeModelInfo setValuesForKeysWithDictionary:infoDic];
            [homeInfoArr addObject:homeModelInfo];
            //NSLog(@"%@",homeInfoArr);
        }
        
        //scrollView
        for (NSArray * arr in homeModelData.img) {
            [homeImgArr addObject:arr];
        }
        
        //collectionView
        for (NSDictionary *hotDic in homeModelData.hot) {
            homeModel_hot * homeHot = [[homeModel_hot alloc]init];
            [homeHot setValuesForKeysWithDictionary:hotDic];
            //NSLog(@"%@",homeHot.menu_attr);
            [homeHotArr addObject:homeHot];
        }
        successData(homeInfoArr,homeImgArr,homeHotArr);
        
    } Failure:^(id failure) {
        
        
    }];
}

@end
