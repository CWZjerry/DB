//
//  hoteRequest.m
//  点吧
//
//  Created by Jerry on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "hoteRequest.h"

@implementation hoteRequest

+(void)GetWithRequest:(SuccessHoteData)successData dicSTR:(NSDictionary *)dicStr failure:(FailureBlock)failureData
{
    [[NetworkRequest shareInstance]POST:@"http://www.kdiana.com/index.php/Before/Orders/menu_list" parameters:dicStr Success:^(id success) {
        
        hoteModel * hoteM = [[hoteModel alloc]init];
        [hoteM setValuesForKeysWithDictionary:success];
        
        NSMutableArray * infoArr = [NSMutableArray array];
        NSMutableArray * typeArr = [NSMutableArray array];
        
        for (NSDictionary * infoDic in hoteM.menu_info) {
            hoteModel_menu_info * hInfo = [[hoteModel_menu_info alloc]init];
            [hInfo setValuesForKeysWithDictionary:infoDic];
            [infoArr addObject:hInfo];
        }
        
        for (NSDictionary * typeDic in hoteM.type) {
            hoteModel_type * typeModel = [[hoteModel_type alloc]init];
            [typeModel setValuesForKeysWithDictionary:typeDic];
            [typeArr addObject:typeModel];
        }
        successData(infoArr,typeArr);
        
    } Failure:^(id failure) {
        
        
    }];
}
@end
