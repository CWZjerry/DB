//
//  hoteTableViewCell.h
//  点吧
//
//  Created by Jerry on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hoteModel.h"

@class hoteTableViewCell;

//签协议
@protocol hotelDelegate <NSObject>
//必须实现的方法
@required
-(void)leftNewHotelTableViewCell:(hoteTableViewCell *)leftHoteCell;
-(void)rightNewHotelTableViewCell:(hoteTableViewCell *)rightHoteCell;
@end

@interface hoteTableViewCell : UITableViewCell

//设置代理
@property(nonatomic,weak) id<hotelDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *foot_type;
@property (weak, nonatomic) IBOutlet UILabel *menu_price;

@property (weak, nonatomic) IBOutlet UITextField *textFieldNum;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UILabel *moneyTitle;

@property(nonatomic,strong) hoteModel_menu_info * hoteInfo;
@end
