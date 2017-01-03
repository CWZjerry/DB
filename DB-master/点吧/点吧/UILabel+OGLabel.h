//
//  UILabel+OGLabel.h
//  点吧
//
//  Created by Pro on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GVColor.h"
@interface UILabel (OGLabel)
- (instancetype)initWithText:(NSString *)text font:(UIFont *)font textColor:(GVColor *)color;
@end
