//
//  homeModel.m
//  点吧
//
//  Created by Jerry on 2017/1/2.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "homeModel.h"

@implementation homeModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefinedKey:%@",key);
}
@end

@implementation homeModel_info

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefinedKey:%@",key);
}
@end

@implementation homeModel_hot

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefinedKey:%@",key);
}
@end
