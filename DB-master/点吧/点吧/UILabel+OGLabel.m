//
//  UILabel+OGLabel.m
//  点吧
//
//  Created by Pro on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "UILabel+OGLabel.h"

@implementation UILabel (OGLabel)


- (instancetype)initWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color{
    
    if (self = [super init]) {
        self.text = text;
        self.font = font;
        self.textColor = color;
        
    }
    return self;
    
}
@end
