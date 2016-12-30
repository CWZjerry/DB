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
#import "ThrowLineTool.h"
#import "sideTableViewCell.h"
@interface hotelViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,ThrowLineToolDelegate,hotelDelegate>

@property(nonatomic,strong) UITableView * hotelTableView;
@property(nonatomic,strong) UISwipeGestureRecognizer*swipeLeft;
@property(nonatomic,strong) UIView *navigationView;//代替导航View
@property(nonatomic,strong) UIView * animationView;//小红点动画View
@property(nonatomic,strong) UIImageView *moneyImg;
@property(nonatomic,strong) UILabel *moneyLabel;//结算总数
@property(nonatomic,strong) UILabel *countLabel; //购物数量
@property(nonatomic,strong) UIImageView *shopImg; //购物车图片
@property(nonatomic,strong) UITableView *sideTableView;//侧滑tableView
@property(nonatomic,assign) BOOL isSide;

@end

@implementation hotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.view addSubview:_animationView];//动画红点view

    [ThrowLineTool sharedTool].delegate=self;//签单例代理
    
    [self.view addSubview:self.hotelTableView];
    [self.view addSubview:self.sideTableView];
    [self sideBtn];
    [self shopBtn];
    [self.view addSubview:self.navigationView];
    
    
}
#pragma mark --侧滑按钮
-(void)sideBtn
{
    UIButton *sideBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    sideBtn.frame=CGRectMake(ZeroFrame, HeightBounds/2-40, 26, 80);
    [sideBtn setImage:[UIImage imageNamed:@"rowing_to_starboard"] forState:UIControlStateNormal];
    [sideBtn addTarget:self action:@selector(sideClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sideBtn];
}

//侧滑缩放
-(void)sideClick:(UIButton *)sender
{
    if(self.isSide == NO)
    {
        [UIView animateWithDuration:0.5 animations:^{
            //设置平移量
            self.hotelTableView.transform = CGAffineTransformMakeTranslation(235, 0);
            self.sideTableView.transform = CGAffineTransformMakeTranslation(235, 0);
            
        }];
        self.isSide = YES;
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            //操作之后进行还原
            self.hotelTableView.transform =CGAffineTransformIdentity;
            self.sideTableView.transform = CGAffineTransformIdentity;
            
        }];
        self.isSide = NO;
    }
   
}
#pragma mark -- 侧滑tableView
-(UITableView *)sideTableView
{
    if(_sideTableView == nil)
    {
        _sideTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, -235, HeightBounds) style:UITableViewStylePlain];
        _sideTableView.delegate =self;
        _sideTableView.dataSource =self;
        _sideTableView.contentInset = UIEdgeInsetsMake(0, 0, -64, 0);
        //设置tableView背景图为uiimage
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"peking"]];
        [_sideTableView addSubview:imageView];
        //设置tableView不显示多余的空cell
        _sideTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _sideTableView;
}
-(void)shopBtn
{
    _moneyImg = [[UIImageView alloc]initWithFrame:CGRectMake(WidthBounds-128, HeightBounds-38, 90, 22)];
    _moneyImg.image = [UIImage imageNamed:@"money"];
    [self.view addSubview:_moneyImg];
    
    //结算总数
    NSString *str = @"1200.00";
    _moneyLabel = [[UILabel alloc]init];
    _moneyLabel.textColor = [GVColor hexStringToColor:@"#333333"];
    _moneyLabel.text = [NSString stringWithFormat:@"￥%@",str];
    _moneyLabel.font = [UIFont systemFontOfSize:12];
    CGFloat widthLabel = [UILabel getWidthWithTitle:_moneyLabel.text font:_moneyLabel.font];
    _moneyLabel.frame = CGRectMake(5, 5, widthLabel, 12);
    [_moneyImg addSubview:_moneyLabel];
    
    //购物车图片
    _shopImg = [[UIImageView alloc]initWithFrame:CGRectMake(WidthBounds-70, HeightBounds-71, 61, 61)];
    _shopImg.image = [UIImage imageNamed:@"shopping_cart"];
    [self.view addSubview:_shopImg];
    
    //购物数量
    _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 13, 14, 14)];
    _countLabel.backgroundColor = [UIColor redColor];
    _countLabel.layer.cornerRadius = 7;
    _countLabel.layer.borderWidth = 0;
    _countLabel.layer.masksToBounds = YES;
    _countLabel.textAlignment = NSTextAlignmentCenter;
    _countLabel.hidden = YES;//是否将其隐藏
    _countLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    _countLabel.font = [UIFont systemFontOfSize:11];
    [_shopImg addSubview:_countLabel];
}
#pragma mark -- 头视图控件
-(UIView *)headNavigation
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 141)];
    headView.userInteractionEnabled = YES;//开启用户交互
    //添加侧滑手势
    _swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSide)];
    _swipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [headView addGestureRecognizer:_swipeLeft];
    
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
    if([tableView isEqual:self.hotelTableView])
    {
       return 92;
    }
    else
    {
        return 45;
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if([tableView isEqual:self.hotelTableView])
    {
        return 10;
    }
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([tableView isEqual:self.hotelTableView])
    {
        return 3;
    }
    else
    {
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView isEqual:self.hotelTableView])
    {
        static NSString * hoteStr =@"hoteTableViewCell";
        hoteTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:hoteStr];
        if (cell == nil) {
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"hoteTableViewCell" owner:self options:nil]lastObject];
        }
        cell.delegate=self;
        cell.textFieldNum.userInteractionEnabled = NO;//关闭用户交互
        //隐藏选择状态
        cell.selectionStyle = 0;
        //隐藏按钮
        [cell.leftBtn setHidden:YES];
        //隐藏label
        if(cell.textFieldNum.text.integerValue <0)
        {
            [cell.textFieldNum setHidden:YES];
        }
        return cell;
    }
    else
    {
        static NSString * sideStr =@"sideTableViewCell";
        sideTableViewCell *sideCell =[tableView dequeueReusableCellWithIdentifier:sideStr];
        if (sideCell == nil) {
            
            sideCell = [[[NSBundle mainBundle] loadNibNamed:@"sideTableViewCell" owner:self options:nil]lastObject];
        }
        sideCell.backgroundColor = [UIColor clearColor];
        return sideCell;
    }
}
//加➕
-(void)rightNewHotelTableViewCell:(hoteTableViewCell *)rightHoteCell
{
    //隐藏按钮
    rightHoteCell.leftBtn.hidden =NO;
    rightHoteCell.textFieldNum.text = [NSString stringWithFormat:@"%ld",(rightHoteCell.textFieldNum.text.integerValue +1)];
    self.countLabel.text = rightHoteCell.textFieldNum.text;
    self.countLabel.hidden = self.countLabel.text.integerValue == 0;//text值为空的时候隐藏
    [self.view addSubview:self.animationView];
    [[ThrowLineTool sharedTool]throwObject:self.animationView from:self.animationView.center to:self.shopImg.center height:-300 duration:0.4];
}
//➖
-(void)leftNewHotelTableViewCell:(hoteTableViewCell *)leftHoteCell
{
    leftHoteCell.textFieldNum.text = [NSString stringWithFormat:@"%ld",(leftHoteCell.textFieldNum.text.integerValue -1) > 0 ? (leftHoteCell.textFieldNum.text.integerValue -1) :0];
    self.countLabel.text = leftHoteCell.textFieldNum.text;
    self.countLabel.hidden = self.countLabel.text.integerValue == 0;//text值为空的时候隐藏
    //为空的时候隐藏按钮
    leftHoteCell.leftBtn.hidden =self.countLabel.text.integerValue == 0;
    leftHoteCell.textFieldNum.hidden = self.countLabel.text.integerValue == 0;
}

//抛物线结束的回调
-(void)animationDidFinish
{
    [self.animationView removeFromSuperview];
    [UIView animateWithDuration:0.1 animations:^{
        _shopImg.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            _shopImg.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            
        }];
    }];
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
//        [_hotelTableView registerNib:[UINib nibWithNibName:NSStringFromClass([hoteTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"hoteTableViewCell"];
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
#pragma mark -- 购物车红点动画View
-(UIView *)animationView
{
    if(_animationView == nil)
    {
        _animationView = [[UILabel alloc]initWithFrame:CGRectMake(0, HeightBounds/2, 14, 14)];
        _animationView.backgroundColor = [UIColor redColor];
        _animationView.layer.cornerRadius = 7;
        _animationView.layer.borderWidth = 0;
        _animationView.layer.masksToBounds = YES;
    }
    return _animationView;
}

@end
