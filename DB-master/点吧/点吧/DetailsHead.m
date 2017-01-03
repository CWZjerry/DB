//
//  DetailsHead.m
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "DetailsHead.h"
#import <UIView+SDAutoLayout.h>
#import "GVColor.h"
#import "TextRect.h"

@implementation DetailsHead

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self addSubview:self.contensView];
        [self setupUI];
    }
    return self;
}
-(UIView *)contensView
{
    if (!_contensView) {
        
    }
    return _contensView;
}
-(void)setupUI
{
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius =20;
    imageview.backgroundColor = [UIColor orangeColor];
//    imageview.image = [UIImage imageNamed:@"0"];
    _imageView = imageview;
    [self addSubview:self.imageView];
    _imageView.sd_layout
    .leftSpaceToView(self,12)
    .topSpaceToView(self,13)
    .widthIs(40)
    .heightIs(40);
    
    
    UILabel *textLabel = [[UILabel alloc]init];
    textLabel.text = @"商家已接单";
    textLabel.font = [UIFont systemFontOfSize:17];
    textLabel.textColor = [GVColor hexStringToColor:@"#333333"];
    _textLabel = textLabel;
    [self addSubview:self.textLabel];
    CGRect rect1 =[TextRect labelTextRect:_textLabel withSuperView:self];
    _textLabel.sd_layout
    .leftSpaceToView(self.imageView,15)
    .topEqualToView(self.imageView)
    .widthIs(rect1.size.width)
    .heightIs(rect1.size.height);
    
    
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.textColor = [GVColor hexStringToColor:@"#aaaaaa"];
    detailLabel.text = @"商品准备中，商家配送";
    detailLabel.font = [UIFont systemFontOfSize:13];
    _detailTextLabel = detailLabel;
    [self addSubview:self.detailTextLabel];
    CGRect rect2 = [TextRect labelTextRect:_detailTextLabel withSuperView:self];
    _detailTextLabel.sd_layout
    .leftEqualToView(self.textLabel)
    .topSpaceToView(self.textLabel,10)
    .widthIs(rect2.size.width)
    .heightIs(rect2.size.height);
    
    
    
}

@end
