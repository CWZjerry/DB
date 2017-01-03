//
//  HomeTableViewCell.m
//  点吧
//
//  Created by Jerry on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setHomeInfo:(homeModel_info *)homeInfo
{
    self.store_name.text = homeInfo.store_name;
    [self.store_photo sd_setImageWithURL:[NSURL URLWithString:homeInfo.store_photo] placeholderImage:[UIImage imageNamed:@"img1"]];
}

@end
