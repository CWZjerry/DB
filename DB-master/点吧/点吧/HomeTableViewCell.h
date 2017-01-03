//
//  HomeTableViewCell.h
//  点吧
//
//  Created by Jerry on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeModel.h"
#import <UIImageView+WebCache.h>
@interface HomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *store_photo;
@property (weak, nonatomic) IBOutlet UILabel *store_name;

@property(nonatomic,strong) homeModel_info * homeInfo;
@end
