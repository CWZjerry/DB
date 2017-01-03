//
//  TextRect.h
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TextRect : NSObject

/**
 通过自体计算label的宽和高

 @param label 要计算的label
 @param view label的父视图
 @return CGRect
 */
+(CGRect)labelTextRect:(UILabel *)label withSuperView:(UIView *)view;
@end
