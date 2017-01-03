//
//  JudgeVegeTableViewCell.m
//  点吧
//
//  Created by Pro on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "JudgeVegeTableViewCell.h"
#import "UILabel+OGLabel.h"
#import <UIView+SDAutoLayout.h>
@implementation JudgeVegeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UILabel *name = [[UILabel alloc]initWithText:@"干锅杏鲍菇" font:[UIFont systemFontOfSize:15] textColor:[GVColor hexStringToColor:@"#888888"]];
    _name = name;
    [self.contentView addSubview:self.name];
    _name.sd_layout
    .leftSpaceToView(self.contentView,12)
    .topSpaceToView(self.contentView,6)
    .widthIs(150)
    .autoHeightRatio(0);
    UIButton *good = [[UIButton alloc]init];
    [good setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
    [good setImage:[UIImage imageNamed:@"praise_up"] forState:UIControlStateSelected];
    _good = good;
    [self.contentView addSubview:self.good];
    _good.sd_layout
    .topEqualToView(self.name)
    .widthIs(15)
    .heightIs(15)
    .xIs([UIScreen mainScreen].bounds.size.width - 27 )
    ;
    UIButton *bad = [[UIButton alloc]init];
    [bad setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
    [bad setImage:[UIImage imageNamed:@"praise_up"] forState:UIControlStateSelected];
    _bad = bad;
    [self.contentView addSubview:self.bad];
    _bad.sd_layout
    .topEqualToView(self.name)
    .widthIs(15)
    .heightIs(15)
    .rightSpaceToView(self.good,15)
    ;
    
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
