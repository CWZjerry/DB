//
//  DetailsView.m
//  点吧
//
//  Created by Pro on 2016/12/30.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "DetailsView.h"
#import "GVColor.h"
#import <UIView+SDAutoLayout.h>
@implementation DetailsView
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
    UILabel *details = [[UILabel alloc]init];
    details.text = @"订单详情";
    details.textColor =[GVColor hexStringToColor:@"#333333"];
    details.font  =[UIFont systemFontOfSize:15];
    _details = details;
    [self addSubview:self.details];
    _details.sd_layout
    .topSpaceToView(self,15)
    .leftSpaceToView(self,12)
    .heightIs(13)
    .widthIs(80);
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    _line = line;
    [self addSubview:self.line];
    _line.sd_layout
    .topSpaceToView(self.details,10)
    .leftSpaceToView(self,12)
    .rightSpaceToView(self,12)
    .heightIs(1);
   
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
