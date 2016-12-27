//
//  AFNManager.h
//  点吧
//
//  Created by Pro on 2016/12/27.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
//宏定义成功block 回调成功后得到的信息
typedef void (^HttpSuccess)(id data);
//宏定义失败block 回调失败信息
typedef void (^HttpFailure)(NSError *error);
typedef enum {
    
    GET,
    POST
} REQUEST;
@interface AFNManager : AFHTTPSessionManager
//单例
+(instancetype)sharedManager;
/**
 AFN的封装

 @param type 枚举判断GET／POST
 @param url 请求路径
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)requestType:(REQUEST *)type URL:(NSString*)url withparameters:(NSDictionary *)parameters success:(HttpSuccess )success failure:(HttpFailure)failure;
@end
