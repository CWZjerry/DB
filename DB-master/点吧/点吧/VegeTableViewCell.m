//
//  VegeTableViewCell.m
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "VegeTableViewCell.h"
#import "GVColor.h"
#import <UIView+SDAutoLayout.h>
@implementation VegeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    UILabel *vagetable = [[UILabel alloc]init];
    vagetable.textColor = [GVColor hexStringToColor:@"#777777"];
    vagetable.font =[UIFont systemFontOfSize:14];
    vagetable.text=@"酸菜排骨";
    _vegetable = vagetable;
    [self.contentView addSubview:self.vegetable];
    _vegetable.sd_layout
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView,12)
    .widthIs(170)
    .heightIs(13);
    
    UILabel *number = [[UILabel alloc]init];
    number.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
    number.font = [UIFont systemFontOfSize:12];
    number.text = @"x1";
    _number = number;
    [self.contentView addSubview:self.number];
    _number.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.vegetable,80)
    .widthIs(35)
    .heightIs(10);
    
    
    UILabel *money = [[UILabel alloc]init];
    money.textColor = [GVColor hexStringToColor:@"#555555"];
    money.font = [UIFont systemFontOfSize:13];
    money.text = @"¥ 300";
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
