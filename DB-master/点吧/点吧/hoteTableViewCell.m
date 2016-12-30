//
//  hoteTableViewCell.m
//  点吧
//
//  Created by Jerry on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "hoteTableViewCell.h"

@implementation hoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.leftBtn addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)leftAction:(UIButton *)button
{
   if([self.delegate respondsToSelector:@selector(leftNewHotelTableViewCell:)])
   {
       [self.delegate leftNewHotelTableViewCell:self];
   }
}
-(void)rightAction:(UIButton *)button
{
    if([self.delegate respondsToSelector:@selector(rightNewHotelTableViewCell:)])
    {
        [self.delegate rightNewHotelTableViewCell:self];
    }
}
//- (void)rightAction:(UIButton *)button{
//    
//    if ([self.delegate respondsToSelector:@selector(newHotelTableViewCell:)]) {
//        
//        [self.delegate newHotelTableViewCell:self];
//    }
//}
//-(void)leftAction:(UIButton *)button
//{
//    if ([self.delegate respondsToSelector:@selector(newHotelTableViewCell:)]) {
//    
//    [self.delegate newHotelTableViewCell:self];
//}
//    
//}
@end
