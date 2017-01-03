//
//  headerCollectionViewCell.m
//  点吧
//
//  Created by Jerry on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "headerCollectionViewCell.h"

@implementation headerCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self ==[super initWithFrame:frame])
    {
        [self addSubview:self.labelClosing];
        [self addSubview:self.store_name];
        [self addSubview:self.labelKM];
        [self addSubview:self.store_photo];
        [self addSubview:self.imageSTR];
        [self addSubview:self.slicing];
        [self addSubview:self.menu_attr];
    }
    return self;
}
-(void)setHomeHot:(homeModel_hot *)homeHot
{
    self.store_name.text = homeHot.store_name;
    self.menu_attr.text = homeHot.menu_attr;
    [self.store_photo sd_setImageWithURL:[NSURL URLWithString:homeHot.store_photo] placeholderImage:[UIImage imageNamed:@"img1"]];
}
//距离
-(UILabel *)labelKM
{
   if(_labelKM == nil)
   {
       _labelKM = [[UILabel alloc]initWithFrame:CGRectMake(110, 192, 50, 12)];
       _labelKM.font = [UIFont systemFontOfSize:12];
       _labelKM.textColor = [GVColor hexStringToColor:@"#888888"];
       _labelKM.text = @"500m";
   }
    return _labelKM;
}
//店名
-(UILabel *)store_name
{
    if(_store_name == nil)
    {
        _store_name = [[UILabel alloc]init];
//        _store_name.text = @"曹文泽的烘焙店";
        _store_name.font = [UIFont systemFontOfSize:18];
        _store_name.frame = CGRectMake(4, 125, 181, 36);
        _store_name.textColor = [GVColor hexStringToColor:@"#888888"];
        _store_name.numberOfLines = 0;
        _store_name.lineBreakMode = 0;
    }
    return _store_name;
}
//成交
-(UILabel *)labelClosing
{
    if(_labelClosing == nil)
    {
        _labelClosing = [[UILabel alloc]initWithFrame:CGRectMake(4, 192, 50, 12)];
        _labelClosing.font = [UIFont systemFontOfSize:12];
        _labelClosing.textColor = [GVColor hexStringToColor:@"#888888"];
        _labelClosing.text = @"成交 681";
    }
    return _labelClosing;
}
//点赞
-(UIImageView *)imageSTR
{
    if(_imageSTR == nil)
    {
        _imageSTR = [[UIImageView alloc]initWithFrame:CGRectMake(4, 168, 12, 12)];
        _imageSTR.image = [UIImage imageNamed:@"start"];
    }
    return _imageSTR;
}
//店门头
-(UIImageView *)store_photo
{
    if(_store_photo == nil)
    {
        _store_photo = [[UIImageView alloc]initWithFrame:CGRectMake(5, ZeroFrame, 145, 110)];
        //_store_photo.image = [UIImage imageNamed:@"img1"];
    }
    return _store_photo;
}
-(UIImageView *)slicing
{
    if(_slicing == nil)
    {
        _slicing = [[UIImageView alloc]initWithFrame:CGRectMake(97, 8, 52, 17)];
        _slicing.image = [UIImage imageNamed:@"tag"];
    }
    return _slicing;
}
-(UILabel *)menu_attr
{
    if(_menu_attr == nil)
    {
        _menu_attr = [[UILabel alloc]initWithFrame:CGRectMake(103, 9, 52, 16)];
        _menu_attr.font = [UIFont systemFontOfSize:12];
        _menu_attr.text = @"12345";
        _menu_attr.textColor = [GVColor hexStringToColor:@"ffba14"];
    }
    return _menu_attr;
}

@end
