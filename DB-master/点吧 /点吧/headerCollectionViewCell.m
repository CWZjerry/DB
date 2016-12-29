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
        [self addSubview:self.labelTitle];
        [self addSubview:self.labelKM];
        [self addSubview:self.imageTitle];
        [self addSubview:self.imageSTR];
    }
    return self;
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
-(UILabel *)labelTitle
{
    if(_labelTitle == nil)
    {
        _labelTitle = [[UILabel alloc]init];
        _labelTitle.text = @"曹文泽的烘焙店";
        _labelTitle.font = [UIFont systemFontOfSize:18];
        _labelTitle.frame = CGRectMake(4, 125, 181, 36);
        _labelTitle.textColor = [GVColor hexStringToColor:@"#888888"];
        _labelTitle.numberOfLines = 0;
        _labelTitle.lineBreakMode = UILineBreakModeCharacterWrap;
    }
    return _labelTitle;
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
-(UIImageView *)imageTitle
{
    if(_imageTitle == nil)
    {
        _imageTitle = [[UIImageView alloc]initWithFrame:CGRectMake(5, ZeroFrame, 145, 110)];
        _imageTitle.image = [UIImage imageNamed:@"img1"];
    }
    return _imageTitle;
}
@end
