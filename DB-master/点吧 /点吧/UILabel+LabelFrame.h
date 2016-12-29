//
//  UILabel+LabelFrame.h
//  点吧
//
//  Created by Jerry on 2016/12/27.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelFrame)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end
