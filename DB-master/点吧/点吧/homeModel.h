//
//  homeModel.h
//  点吧
//
//  Created by Jerry on 2017/1/2.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@class homeModel_hot;
@class homeModel_info;

@interface homeModel : NSObject

@property(nonatomic,strong) NSArray *info;
@property(nonatomic,assign) NSInteger page_all;
@property(nonatomic,assign) NSInteger page;
@property(nonatomic,strong) NSArray * img;
@property(nonatomic,strong) NSArray * hot;
@property(nonatomic,strong) NSString * city;
@end

@interface homeModel_info: NSObject
@property(nonatomic,strong) NSString * id;
@property(nonatomic,strong) NSString * store_attr;
@property(nonatomic,strong) NSString * store_name;
@property(nonatomic,strong) NSString * store_address;
@property(nonatomic,strong) NSString * star;
@property(nonatomic,strong) NSString * store_photo;
@property(nonatomic,strong) NSString * is_outsite;
@property(nonatomic,strong) NSString * menu_attr;
@property(nonatomic,strong) NSString * juli;
@property(nonatomic,strong) NSString * count;
@end


@interface homeModel_hot : NSObject
@property(nonatomic,strong) NSString * id;
@property(nonatomic,strong) NSString * count;
@property(nonatomic,strong) NSString * store_photo;
@property(nonatomic,strong) NSString * star;
@property(nonatomic,strong) NSString * menu_attr;
@property(nonatomic,strong) NSString * store_id;
@property(nonatomic,strong) NSString * store_name;
@property(nonatomic,strong) NSString * is_outsite;
@property(nonatomic,strong) NSString * juli;
@end
