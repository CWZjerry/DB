//
//  Order.h
//  点吧
//
//  Created by Pro on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject
@property(nonatomic,strong)NSString *eat_type;
@property(nonatomic,strong)NSString *finish_state;
@property(nonatomic,strong)NSString *order_time;
@property(nonatomic,strong)NSString *store_name;
@property(nonatomic,strong)NSString *store_photo;

@end
