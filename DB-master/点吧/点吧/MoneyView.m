//
//  MoneyView.m
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "MoneyView.h"
#import "GVColor.h"
#import <UIView+SDAutoLayout.h>
@implementation MoneyView
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    UILabel *money = [[UILabel alloc]init];
    money.text = @"600";
    money.textColor = [GVColor hexStringToColor:@"#ff1e00"];
    money.font = [UIFont systemFontOfSize:17];
    _money = money;
    [self.contentView addSubview:self.money];
    _money.sd_layout
    .rightSpaceToView(self.contentView,12)
    .topSpaceToView(self.contentView,14)
    .bottomSpaceToView(self.contentView,15)
    .widthIs(40);
    UILabel *amount = [[UILabel alloc]init];
    amount.textColor = [GVColor hexStringToColor:@"#333333"];
    amount.text = @"合计：¥";
    amount.font = [UIFont systemFontOfSize:12];
    _amount = amount;
    [self.contentView addSubview:self.amount];
    _amount.sd_layout
    .rightSpaceToView(self.money,0)
    .topEqualToView(self.money)
    .bottomEqualToView(self.money)
    .widthIs(50);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
