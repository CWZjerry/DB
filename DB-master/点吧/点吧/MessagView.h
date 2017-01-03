//
//  MessagView.h
//  点吧
//
//  Created by Pro on 2016/12/31.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessagView : UIView
@property(nonatomic,strong)UIButton *rightBtn;
//头像
@property(nonatomic,strong)UIImageView *imageView;
//饭店名称
@property(nonatomic,strong)UILabel *nameLabel;
//订单号码
@property(nonatomic,strong)UILabel *numberLabel;
//订单类型
@property(nonatomic,strong)UILabel *typeLabel;
//点餐模式
@property(nonatomic,strong)UILabel *moshiLabel;
//就餐人数
@property(nonatomic,strong)UILabel *personLabel;
//桌号
@property(nonatomic,strong)UILabel *zhuohaoLabel;
//时间
@property(nonatomic,strong)UILabel *timeLabel;
@end
