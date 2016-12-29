//
//  TotalTableViewCell.h
//  点吧
//
//  Created by Pro on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalTableViewCell : UITableViewCell
//订单号
@property(nonatomic,strong)UILabel *numberLab;
//商家图片
@property(nonatomic,strong)UIImageView *headImageView;
//商店名称
@property(nonatomic,strong)UILabel *shopNameLab;
//外卖
@property(nonatomic,strong)UILabel *typeLab;
//订餐方式
@property(nonatomic,strong)UILabel *wayLab;
//下单时间
@property(nonatomic,strong)UILabel *orderTimeLab;
//金额
@property(nonatomic,strong)UILabel *moneyLab;
//付款
@property(nonatomic,strong)UILabel *payLab;
//订单跟踪
@property(nonatomic,strong)UIButton *paceBtn;
//顶部线条
@property(nonatomic,strong)UILabel *topLineLab;
//底部线条
@property(nonatomic,strong)UILabel *bottomLineLab;

@end
