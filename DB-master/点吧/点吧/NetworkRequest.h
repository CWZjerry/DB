//
//  NetworkRequest.h
//  点吧
//
//  Created by Jenny on 2016/12/30.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id success);
typedef void(^FailureBlock)(id failure);

@interface NetworkRequest : NSObject<NSCopying>

+ (instancetype)shareInstance;

//网络请求
- (void)POST:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)succ Failure:(FailureBlock)fail;
@end
