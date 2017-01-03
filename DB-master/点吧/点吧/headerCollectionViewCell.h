//
//  headerCollectionViewCell.h
//  点吧
//
//  Created by Jerry on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVColor.h"
#import "homeModel.h"
#import <UIImageView+WebCache.h>
@interface headerCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView * store_photo;
@property(nonatomic,strong) UIImageView * imageSTR;
@property(nonatomic,strong) UILabel *store_name;//店名
@property(nonatomic,strong) UILabel *labelClosing;//成交
@property(nonatomic,strong) UILabel *labelKM;//距离
@property(nonatomic,strong) UIImageView * slicing;
@property(nonatomic,strong) UILabel * menu_attr;

@property(nonatomic,strong) homeModel_hot * homeHot;
@end
