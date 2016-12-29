//
//  hotelViewController.m
//  点吧
//
//  Created by Jerry on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "hotelViewController.h"
#import "GVColor.h"
#import "UILabel+LabelFrame.h"
#import "hoteTableViewCell.h"
#import "HomeViewController.h"
@interface hotelViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UISwipeGestureRecognizer *swipeLeft;
}
@property(nonatomic,strong) UITableView * hotelTableView;
@property(nonatomic,strong) UIView *navigationView;
@end

@implementation hotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.hotelTableView];
    [self sideBtn];
    [self.view addSubview:self.navigationView];
}
#pragma mark --侧滑按钮
-(void)sideBtn
{
    UIButton *sideBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    sideBtn.frame=CGRectMake(ZeroFrame, HeightBounds/2-40, 26, 80);
    [sideBtn setImage:[UIImage imageNamed:@"rowing_to_starboard"] forState:UIControlStateNormal];
    [self.view addSubview:sideBtn];
}
#pragma mark -- 头视图控件
-(UIView *)headNavigation
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 141)];
    headView.userInteractionEnabled = YES;//开启用户交互
    //添加侧滑手势
    swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSide)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [headView addGestureRecognizer:swipeLeft];
    
    //店铺背景图
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 141)];
    bgImgView.image = [UIImage imageNamed:@"img1"];
    //设置为高斯模糊
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, bgImgView.frame.size.width, bgImgView.frame.size.height);
    [bgImgView addSubview:effectView];
    [headView addSubview:bgImgView];
    
    //店铺图片
    UIImageView * userImage = [[UIImageView alloc]initWithFrame:CGRectMake(12, 44, 55, 55)];
    userImage.image = [UIImage imageNamed:@"img2"];
    userImage.layer.cornerRadius = 26;
    userImage.layer.masksToBounds = YES;
    [headView addSubview:userImage];
    
    //店铺名字
    UILabel * hotelLabel =[[UILabel alloc]initWithFrame:CGRectMake(77, 43, 0, 0)];
    hotelLabel.text =@"曹文泽的小吃一条街";
    hotelLabel.font = [UIFont systemFontOfSize:19];
    hotelLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    //自适应宽度
    CGFloat hotelWidth = [UILabel getWidthWithTitle:hotelLabel.text font:hotelLabel.font];
    hotelLabel.frame = CGRectMake(77, 43, hotelWidth, 19);
    [headView addSubview:hotelLabel];
    
    //店铺简介
    UILabel * hotelLabelTwo =[[UILabel alloc]initWithFrame:CGRectMake(77, 65, WidthBounds-90, 38)];
    hotelLabelTwo.text =@"人最伟大，得人心者就会得到一切。得财富者失人心，财富也失。故此我们要结好人缘。坚定的信心，能使平凡的人们，做出惊人的事业。对于凌驾命运之上的人来说，信心就是生命的主宰。－－海伦·凯勒";
    hotelLabelTwo.font = [UIFont systemFontOfSize:13];
    hotelLabelTwo.textColor = [GVColor hexStringToColor:@"#eeeeee"];
    hotelLabelTwo.textAlignment = NSTextAlignmentLeft;
    //自动折行设置
    hotelLabelTwo.lineBreakMode = 0;//以单词为单位换行
    hotelLabelTwo.lineBreakMode = 4;//尾部显示...
    hotelLabelTwo.numberOfLines = 0;//是否显示多行
    [headView addSubview:hotelLabelTwo];
    
    //背景
    UILabel * backLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 121, WidthBounds, 20)];
    backLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [headView addSubview:backLabel];
    
    //优惠图标
    UIImageView *favorImage =[[UIImageView alloc]initWithFrame:CGRectMake(12, 122.5, 17, 17)];
    favorImage.image = [UIImage imageNamed:@"benefit"];
    [headView addSubview:favorImage];
    
    //优惠券
    UILabel *favorLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 122.5, 0, 0)];
    favorLabel.text =@"满100减10元,满两百减30元.";
    favorLabel.font = [UIFont systemFontOfSize:14];
    favorLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    CGFloat favorLabelTwo =[UILabel getWidthWithTitle:favorLabel.text font:favorLabel.font];
    favorLabel.frame =CGRectMake(40, 124, favorLabelTwo, 14);
    [headView addSubview:favorLabel];
    
    //点赞
    UIButton *heartBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    heartBtn.frame=CGRectMake(WidthBounds-30, 14, 18, 18);
    [heartBtn setImage:[UIImage imageNamed:@"collect_down"] forState:UIControlStateNormal];
    [headView addSubview:heartBtn];
    
    //外卖
    UIButton *takeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    takeBtn.frame=CGRectMake(WidthBounds-85, 121, 73, 18);
    [takeBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [takeBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [takeBtn setTitle:@"我要点外卖" forState:UIControlStateNormal];
    [headView addSubview:takeBtn];
    
    return headView;
}
//侧滑手势事件
-(void)leftSide
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -- tableViewDatasoure
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 92;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString * hoteStr =@"hoteTableViewCell";
    hoteTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:hoteStr];

    return cell;
}

//渐变(改变透明度)
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    if(offset<=0 && offset<=-90)
    {
        self.navigationView.alpha = 0;
    }
    else if(offset <= 500)
    {
        self.navigationView.alpha = offset/200;
    }
}
-(UITableView *)hotelTableView
{
    if(_hotelTableView == nil)
    {
        _hotelTableView = [[UITableView alloc]initWithFrame:FrameBounds style:UITableViewStyleGrouped];
        _hotelTableView.delegate = self;
        _hotelTableView.dataSource =self;
        _hotelTableView.tableHeaderView = [self headNavigation];//头视图
        [_hotelTableView registerNib:[UINib nibWithNibName:NSStringFromClass([hoteTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"hoteTableViewCell"];
    }
    return _hotelTableView;
}
#pragma mark -- 导航栏view
-(UIView *)navigationView
{
    if(_navigationView == nil)
    {
        _navigationView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, WidthBounds, 64)];
        _navigationView.backgroundColor = [UIColor colorWithRed:245/255.0 green:147/255.0 blue:39/255.0 alpha:1.0];
        
        UIButton *b=[UIButton buttonWithType:UIButtonTypeCustom];
        b.frame=CGRectMake(10, 25, 22, 32);
        [b setImage:[UIImage imageNamed:@"箭头"] forState:UIControlStateNormal];
        [b addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
        [_navigationView addSubview:b];
    }
    return _navigationView;
}
//箭头返回事件
-(void)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
