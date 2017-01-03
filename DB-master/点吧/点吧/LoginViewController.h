//
//  LoginViewController.h
//  点吧
//
//  Created by Jenny on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
typedef void (^ReturnTextBlock)(NSString *showText);
@interface LoginViewController : UIViewController
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;
- (void)returnText:(ReturnTextBlock)block;

@property (nonatomic,strong) User *user;
@end
