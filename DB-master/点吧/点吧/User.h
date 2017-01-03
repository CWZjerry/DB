//
//  User.h
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (nonatomic,strong) NSData *image; //头像
@property (nonatomic,strong) NSString *name;//昵称

@property (nonatomic,strong) NSString *birthday; //生日
@property (nonatomic,strong) NSString *phoneNum;  //电话
@property (nonatomic,strong) NSString *password; //密码

@property (nonatomic,strong) NSString *comeDate;
@end
