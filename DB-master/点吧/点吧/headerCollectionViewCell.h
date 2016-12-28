//
//  headerCollectionViewCell.h
//  点吧
//
//  Created by Jerry on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVColor.h"
@interface headerCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView * imageTitle;
@property(nonatomic,strong) UIImageView * imageSTR;
@property(nonatomic,strong) UILabel *labelTitle;//店名
@property(nonatomic,strong) UILabel *labelClosing;//成交
@property(nonatomic,strong) UILabel *labelKM;//距离
@end
