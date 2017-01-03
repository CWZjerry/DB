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

+(void)LogininforRequestWithUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failure
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[[AFHTTPSessionManager alloc] init]initWithSessionConfiguration:configuration];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.securityPolicy setAllowInvalidCertificates:NO];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}
+(void)requestForPhoneCodeUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failurl
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer.acceptableContentTypes =nil;
    [manager.securityPolicy setAllowInvalidCertificates:NO];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failurl(error);
    }];
}
@end
