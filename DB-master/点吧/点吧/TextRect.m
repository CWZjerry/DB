//
//  TextRect.m
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "TextRect.h"

@implementation TextRect
//根据字体计算高度与宽度
+(CGRect)labelTextRect:(UILabel *)label withSuperView:(UIView *)view
{
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByCharWrapping;
    NSDictionary *dic=@{NSFontAttributeName:label.font,NSParagraphStyleAttributeName:paragraphstyle.copy};
    CGRect rect=[label.text boundingRectWithSize:CGSizeMake(view.frame.size.width, view.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect;
}
@end
