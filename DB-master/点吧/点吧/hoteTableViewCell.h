//
//  hoteTableViewCell.h
//  点吧
//
//  Created by Jerry on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
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

@property (weak, nonatomic) IBOutlet UITextField *textFieldNum;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UILabel *testLable;

@end
