//
//  CostTableViewCell.m
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "CostTableViewCell.h"
#import "GVColor.h"
#import <UIView+SDAutoLayout.h>
@implementation CostTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        
    }
    return self;
}
-(void)setupUI
{
    UILabel *freght = [[UILabel alloc]init];
    freght.font = [UIFont systemFontOfSize:13];
    freght.text = @"配送费";
    freght.textColor = [GVColor hexStringToColor:@"#888888"];
    _freight = freght;
    [self.contentView addSubview:self.freight];
    _freight.sd_layout
    .leftSpaceToView(self.contentView,12)
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .widthIs(170);
    UILabel *money =[[UILabel alloc]init];
    money.text=@"¥ 200";
    money.textColor = [GVColor hexStringToColor:@"#888888"];
    money.font =[UIFont systemFontOfSize:13];
    _money = money;
    [self.contentView addSubview:self.money];
    _money.sd_layout
    .rightSpaceToView(self.contentView,12)
    .centerYEqualToView(self.contentView)
    .widthIs(40)
    .heightIs(13);
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
