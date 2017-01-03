//
//  MessagView.m
//  点吧
//
//  Created by Pro on 2016/12/31.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "MessagView.h"
#import "GVColor.h"
#import <UIView+SDAutoLayout.h>
#import "UILabel+OGLabel.h"
#define GARY @"#aaaaaa"
@implementation MessagView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
        
    }
    return self;
}
-(void)setupUI
{
    UIButton *right =[[UIButton alloc]init];
    right.backgroundColor = [UIColor redColor];
    [right setImage:[UIImage imageNamed:@"pull"] forState:UIControlStateNormal];
    _rightBtn = right;
    [self addSubview:self.rightBtn];
    _rightBtn.sd_layout
    .topSpaceToView(self,30)
    .rightSpaceToView(self,12)
    .widthIs(8)
    .heightIs(6)
    ;
    
    UIImageView *image =[[UIImageView alloc]init];
    image.layer.cornerRadius = 15;
    image.layer.masksToBounds = YES;
    image.backgroundColor =[UIColor orangeColor];
    _imageView = image;
    [self addSubview:self.imageView];
    _imageView.sd_layout
    .leftSpaceToView(self,12)
    .topSpaceToView(self,15)
    .widthIs(30)
    .heightIs(30);
    UILabel *namelabel = [[UILabel alloc]init];
    namelabel.textColor = [GVColor hexStringToColor:@"#333333"];
    namelabel.text = @"微动点大饭店西三旗店";
    namelabel.font = [UIFont systemFontOfSize:15];
    _nameLabel = namelabel;
    [self addSubview:self.nameLabel];
    _nameLabel.sd_layout
    .leftSpaceToView(self.imageView,10)
    .topEqualToView(self.imageView)
    .widthIs(200)
    .heightIs(13);
    UILabel *numberLabel =[[ UILabel alloc]init];
    numberLabel.text = @"订单号：123442352452";
    numberLabel.textColor = [GVColor hexStringToColor:@"#cccccc"];
    numberLabel.font = [UIFont systemFontOfSize:12];
    _numberLabel = numberLabel;
    [self addSubview:self.numberLabel];
    _numberLabel.sd_layout
    .leftEqualToView(self.nameLabel)
    .topSpaceToView(self.nameLabel,7)
    .widthIs(200)
    .heightIs(10);
    UILabel *typeLabel = [[UILabel alloc]init];
    typeLabel.textColor = [GVColor hexStringToColor:GARY];
    typeLabel.text = @"订单类型：外卖";
    typeLabel.font = [UIFont systemFontOfSize:14];
    _typeLabel = typeLabel;
    [self addSubview:self.typeLabel];
    _typeLabel.sd_layout
    .leftEqualToView(self.imageView)
    .topSpaceToView(self.imageView,10)
    .heightIs(13)
    .widthIs(150);
    UILabel *moshiLabel  = [[UILabel alloc]init];
    moshiLabel.text = @"点餐模式：店内";
    moshiLabel.textColor = [GVColor hexStringToColor:GARY];
    moshiLabel.font =[UIFont systemFontOfSize:14];
    _moshiLabel = moshiLabel;
    [self addSubview:self.moshiLabel];
    _moshiLabel.sd_layout
    .leftSpaceToView(self,187)
    .topEqualToView(self.typeLabel)
    .widthIs(self.width - 187)
    .heightIs(10);
    
    UILabel *perison= [[UILabel alloc]initWithText:@"就餐人数：6人" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:GARY]];
    _personLabel = perison;
    [self addSubview:self.personLabel];
    _personLabel.sd_layout
    .leftEqualToView(typeLabel)
    .topSpaceToView(self.typeLabel,5)
    .widthIs(100)
    .heightIs(10);
    UILabel *zhuohao = [[UILabel alloc]initWithText:@"桌号：雅包(108)" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:GARY]];
    _zhuohaoLabel = zhuohao;
    [self addSubview:self.zhuohaoLabel];
    _zhuohaoLabel.sd_layout
    .leftEqualToView(self.moshiLabel)
    .topSpaceToView(self.moshiLabel,10)
    .widthIs(150)
    .heightIs(10);
    UILabel *time = [[UILabel alloc]initWithText:@"到店时间" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:GARY]];
    _timeLabel  = time;
    [self addSubview:self.timeLabel];
    _timeLabel.sd_layout
    .leftEqualToView(self.personLabel)
    .topSpaceToView(self.personLabel,5)
    .widthIs(200)
    .heightIs(10);
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
