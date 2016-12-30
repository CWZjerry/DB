//
//  DetailsMessage.m
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "DetailsMessage.h"
#import "GVColor.h"
#import "TextRect.h"
#import <UIView+SDAutoLayout.h>
@implementation DetailsMessage
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    UIImageView *image = [[UIImageView alloc]init];
    image.backgroundColor = [UIColor orangeColor];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = 10;
    _imageView = image;
    [self addSubview:self.imageView];
    _imageView.sd_layout
    .leftSpaceToView(self,12)
    .topSpaceToView(self,10)
    .widthIs(20)
    .heightIs(20);
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"微动点大饭店西三旗店";
    nameLabel.textColor = [GVColor hexStringToColor:@"#333333"];
    nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel = nameLabel;
    [self addSubview:self.nameLabel];
    CGRect rect =[TextRect labelTextRect:_nameLabel withSuperView:self];
    _nameLabel.sd_layout
    .leftSpaceToView(self.imageView,10)
    .centerYEqualToView(self)
    .heightIs(rect.size.height)
    .widthIs(rect.size.width);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
