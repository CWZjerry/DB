//
//  NetworkRequest.m
//  点吧
//
//  Created by Jenny on 2016/12/30.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "NetworkRequest.h"
#import <AFNetworking/AFNetworking.h>

@implementation NetworkRequest
static NetworkRequest *request = nil;
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[NetworkRequest alloc] init];
    });
    return request;
}
- (id)copyWithZone:(NSZone *)zone{
    return request;
}

- (void)POST:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)succ Failure:(FailureBlock)fail{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = nil;
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succ(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
@end
