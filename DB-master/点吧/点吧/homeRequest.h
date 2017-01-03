//
//  homeRequest.h
//  点吧
//
//  Created by Jerry on 2017/1/2.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkRequest.h"
#import "homeModel.h"

typedef void(^SuccessBlockData)(id Value,id img, id hot);

@interface homeRequest : NSObject
+(void)GetWithRequest:(SuccessBlockData)successData failure:(FailureBlock)failureData;
@end
