//
//  TotalTableViewCell.m
//  点吧
//
//  Created by Pro on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "TotalTableViewCell.h"
#import <UIView+SDAutoLayout.h>


#import "GVColor.h"
#define GRAY #aaaaaa
@implementation TotalTableViewCell
/*
 @property(nonatomic,strong)UILabel *numberLab;
 @property(nonatomic,strong)UIImageView *headImageView;
 @property(nonatomic,strong)UILabel *shopNameLab;
 @property(nonatomic,strong)UILabel *typeLab;
 @property(nonatomic,strong)UILabel *wayLab;
 @property(nonatomic,strong)UILabel *orderTimeLab;
 @property(nonatomic,strong)UILabel *moneyLab;
 @property(nonatomic,strong)UILabel *payLab;
 @property(nonatomic,strong)UIButton *paceBtn;
 @property(nonatomic,strong)UILabel *topLineLab;
 @property(nonatomic,strong)UILabel *bottomLineLab;
 */
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self.contentView addSubview:self.payLab];
//    }
//    return self;
//}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.numberLab];
        CGRect rect2 = [self labelTextRect:_numberLab];
        _numberLab.sd_layout
        .leftSpaceToView(self.contentView,12)
        .topSpaceToView(self.contentView,10)
        .widthIs(rect2.size.width)
        .heightIs(rect2.size.height);
        
        [self.contentView addSubview:self.payLab];
        CGRect rect1 = [self labelTextRect:_payLab];
        _payLab.sd_layout
        .topSpaceToView(self.contentView,10)
        .rightSpaceToView(self.contentView,12)
        .widthIs(rect1.size.width)
        .heightIs(rect1.size.height);
        
        [self.contentView addSubview:self.topLineLab];
        _topLineLab.sd_layout
        .topSpaceToView(self.numberLab,10)
        .leftEqualToView(self.numberLab)
        .rightEqualToView(self.payLab)
        .heightIs(1);
        
        [self.contentView addSubview:self.headImageView];
        _headImageView.sd_layout
        .leftEqualToView(self.topLineLab)
        .topSpaceToView(self.topLineLab,12)
        .widthIs(90)
        .heightIs(67);
        
        [self.contentView addSubview:self.shopNameLab];
        CGRect rect3 =[self labelTextRect:_shopNameLab];
        _shopNameLab.sd_layout
        .leftSpaceToView(self.headImageView,10)
        .topEqualToView(self.headImageView)
        .widthIs(rect3.size.width)
        .heightIs(rect3.size.height);
        
        [self.contentView addSubview:self.typeLab];
        CGRect rect4 =[self labelTextRect:_typeLab];
        _typeLab.sd_layout
        .leftEqualToView(self.shopNameLab)
        .topSpaceToView(self.shopNameLab,14)
        .widthIs(rect4.size.width)
        .heightIs(rect4.size.height);
        
        [self.contentView addSubview:self.wayLab];
        CGRect rect5 = [self labelTextRect:_wayLab];
        _wayLab.sd_layout
        .leftSpaceToView(self.typeLab,20)
        .topEqualToView(self.typeLab)
        .widthIs(rect5.size.width)
        .heightIs(rect5.size.height);
        
        [self.contentView addSubview:self.orderTimeLab];
        CGRect rect6 = [self labelTextRect:_orderTimeLab];
        _orderTimeLab.sd_layout
        .leftEqualToView(self.typeLab)
        .topSpaceToView(self.typeLab,12)
        .widthIs(rect6.size.width)
        .bottomEqualToView(self.headImageView);
        
        [self.contentView addSubview:self.bottomLineLab];
        _bottomLineLab.sd_layout
        .leftEqualToView(self.topLineLab)
        .rightEqualToView(self.topLineLab)
        .topSpaceToView(self.headImageView,15)
        .heightIs(1);

        [self.contentView addSubview:self.paceBtn];
        _paceBtn.sd_layout
        .leftEqualToView(self.bottomLineLab)
        .topSpaceToView(self.bottomLineLab,12)
        .widthIs(60)
        .heightIs(20);
        
        [self.contentView addSubview:self.moneyLab];
         CGRect rect7= [self labelTextRect:_moneyLab];
        _moneyLab.sd_layout
        .topSpaceToView(self.bottomLineLab,12)
        .rightSpaceToView(self.contentView,12)
        .widthIs(rect7.size.width)
        .heightIs(rect7.size.height);
        
        
    }
    return self;
}

-(UILabel *)moneyLab
{
    if (!_moneyLab ) {
        _moneyLab = [[UILabel alloc]init];
        _moneyLab.textColor = [GVColor hexStringToColor:@"#333333"];
        _moneyLab.font = [UIFont systemFontOfSize:15];
        _moneyLab.text = @"总金额\t¥230";
    }
    return _moneyLab;
}
-(UIButton *)paceBtn
{
    if (!_paceBtn) {
        _paceBtn = [[UIButton alloc]init];
        [_paceBtn setTitleColor:[GVColor hexStringToColor:@"#666666"] forState:UIControlStateNormal];
        [_paceBtn setTitle:@"进度查询" forState:UIControlStateNormal];
        _paceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _paceBtn.layer.borderWidth = 1;
        _paceBtn.layer.borderColor =[GVColor hexStringToColor:@"#666666"].CGColor;
        
    }
    return _paceBtn;
}
-(UILabel *)bottomLineLab
{
    if (!_bottomLineLab) {
        _bottomLineLab = [[UILabel alloc]init];
        _bottomLineLab.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    }
    return _bottomLineLab;
}
-(UILabel *)orderTimeLab
{
    if (!_orderTimeLab) {
        _orderTimeLab = [[UILabel alloc]init];
        _orderTimeLab.text = @"下单时间：2016-10-19\t17:00";
        _orderTimeLab.font = [UIFont systemFontOfSize:13];
        
        _orderTimeLab.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
    }
    return _orderTimeLab;
}
-(UILabel *)wayLab
{
    if (!_wayLab) {
        _wayLab = [[UILabel alloc]init];
        _wayLab.textColor = [GVColor hexStringToColor:@"#888888"];
        _wayLab.text = @"网络订餐";
        _wayLab.font = [UIFont systemFontOfSize:14];
    }
    return _wayLab;
}
-(UILabel *)typeLab
{
    if (!_typeLab) {
        _typeLab = [[UILabel alloc]init];
        _typeLab.text = @"外卖";
        _typeLab.textColor = [GVColor hexStringToColor:@"#888888"];
        _typeLab.font = [UIFont systemFontOfSize:14];
        
    }
    return _typeLab;
}
-(UILabel *)shopNameLab
{
    if (!_shopNameLab) {
        _shopNameLab = [[UILabel alloc]init];
        _shopNameLab.text = @"微动点大饭店西三旗店";
        _shopNameLab.font = [UIFont systemFontOfSize:16];
        _shopNameLab.textColor = [GVColor hexStringToColor:@"#333333"];
        
    }
    return _shopNameLab;
}
-(UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.backgroundColor = [UIColor redColor];
    }
    return _headImageView;
}
-(UILabel *)topLineLab
{
    if (!_topLineLab) {
        _topLineLab = [[UILabel alloc]init];
        _topLineLab.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    }
    return _topLineLab;
}
-(UILabel *)payLab
{
    if (!_payLab) {
        _payLab = [[UILabel alloc]init];
        _payLab.text = @"代付款";
        _payLab.font = [UIFont systemFontOfSize:12];
        _payLab.textColor = [GVColor hexStringToColor:@"#ffba14"];
        
        
    }
    return _payLab;
}
-(UILabel *)numberLab
{
    if (!_numberLab) {
        
        _numberLab = [[UILabel alloc]init];
        _numberLab.text = @"订单号：2016102916286997";
        _numberLab.font = [UIFont systemFontOfSize:13];
        _numberLab.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
        
    }
    return _numberLab;
}
//根据字体计算高度与宽度
-(CGRect)labelTextRect:(UILabel *)label
{
    
    NSLog(@"%@",label);
    
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByCharWrapping;
    NSDictionary *dic=@{NSFontAttributeName:label.font,NSParagraphStyleAttributeName:paragraphstyle.copy};
    CGRect rect=[label.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width, self.contentView.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect;
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
