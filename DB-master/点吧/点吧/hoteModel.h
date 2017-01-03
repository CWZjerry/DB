//
//  hoteModel.h
//  点吧
//
//  Created by Jerry on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class hoteModel_type;
@class hoteModel_menu_info;


@interface hoteModel : NSObject
@property(nonatomic,assign) NSInteger id;
@property(nonatomic,assign) NSInteger is_outsite;
@property(nonatomic,strong) NSArray * menu_info;
@property(nonatomic,strong) NSString * store_con;
@property(nonatomic,strong) NSString * store_name;
@property(nonatomic,strong) NSString * store_photo;
@property(nonatomic,strong) NSArray * type;
@end


@interface hoteModel_menu_info : NSObject

@property(nonatomic,assign) NSInteger  count_num;
@property(nonatomic,strong) NSString * foot_type;
@property(nonatomic,assign) NSInteger  id;
@property(nonatomic,strong) NSString * menu_name;
@property(nonatomic,strong) NSString * menu_price;
@property(nonatomic,strong) NSString * menu_type;
@property(nonatomic,strong) NSString * photo;
@property(nonatomic,strong) NSString * rated;
@property(nonatomic,assign) NSInteger  stock;
@end

@interface hoteModel_type : NSObject
@property(nonatomic,strong) NSString * foot_type;
@property(nonatomic,assign) NSInteger id;
@end
