//
//  countDown.m
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "countDown.h"

@implementation countDown

+(void)countDownWithButton:(UIButton *)button
{
    button.enabled = NO;
    __block NSInteger i = 60;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        i--;
        [button setTitle:[NSString stringWithFormat:@"%lds重新发送",i] forState:UIControlStateNormal];
        if (i == 0) {
            [timer setFireDate:[NSDate distantFuture]];
            [button setTitle:@"发送验证码" forState:UIControlStateNormal];
            button.enabled = YES;
        }
    }];
    [timer fire];
    
}

@end
