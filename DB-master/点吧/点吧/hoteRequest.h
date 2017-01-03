//
//  hoteRequest.h
//  点吧
//
//  Created by Jerry on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkRequest.h"
#import "hoteModel.h"
typedef void(^SuccessHoteData)(id Value,id typeValue);

@interface hoteRequest : NSObject

+(void)GetWithRequest:(SuccessHoteData)successData dicSTR:(NSDictionary *)dicStr failure:(FailureBlock)failureData;
@end
