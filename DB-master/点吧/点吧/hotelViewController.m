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
#import "hoteRequest.h"
@interface hotelViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,ThrowLineToolDelegate,hotelDelegate>
{
    NSArray *sideTitleArr;
    NSArray * _infoArr;
    NSArray * _typeArr;
}
@property(nonatomic,strong) UITableView * hotelTableView;//右侧tableView
@property(nonatomic,strong) UISwipeGestureRecognizer*swipeLeft;
@property(nonatomic,strong) UIView *navigationView;//代替导航View
@property(nonatomic,strong) UIView * animationView;//小红点动画View
@property(nonatomic,strong) UIImageView *moneyImg;
@property(nonatomic,strong) UILabel *moneyLabel;//结算总数
@property(nonatomic,strong) UILabel *countLabel; //购物数量
@property(nonatomic,strong) UIImageView *shopImg; //购物车图片
@property(nonatomic,strong) UITableView *sideTableView;//左侧tableView
@property(nonatomic,strong) UISearchBar * headerSearchBar;//头视图搜索条
@property(nonatomic,assign) BOOL isSide;

@end

@implementation hotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    sideTitleArr = @[@"全部",@"烧烤",@"甜品",@"主食",@"酒水"];
    [self.view addSubview:_animationView];//动画红点view

    [ThrowLineTool sharedTool].delegate=self;//签单例代理
    
    [self.view addSubview:self.hotelTableView];
    [self.view addSubview:self.sideTableView];
    [self sideBtn];
    [self shopBtn];
    [self.view addSubview:self.navigationView];
    
    [self MJRefreshTableView];
    
    
}
-(void)MJRefreshTableView
{
    //上拉刷新
    self.hotelTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSDictionary *dic= [NSDictionary dictionaryWithObjectsAndKeys:self.idDic,@"store_id", nil] ;
        
        [hoteRequest GetWithRequest:^(id Value, id typeValue) {
            
            _infoArr = Value;
            _typeArr = typeValue;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.hotelTableView.mj_header endRefreshing];
                [self.hotelTableView reloadData];
            });
            
        } dicSTR:dic failure:^(id failure) {
            
        }];
    }];
    //马上进入刷新状态
    [self.hotelTableView.mj_header beginRefreshing];

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

#pragma mark -- 左侧sideHeaderView视图
-(UIView *)sideHeaderView
{
    UIView * sideHeaderView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, 235, 45)];
    [sideHeaderView addSubview:self.headerSearchBar];
    
    return sideHeaderView;
}
-(UISearchBar *)headerSearchBar
{
    if(_headerSearchBar == nil)
    {
        _headerSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(22.5, 15, 190, 25)];
        // 1.设置背景色
        //设置背景图去掉上下黑线
        _headerSearchBar.backgroundImage = [[UIImage alloc]init];
        //背景颜色设置为白色
        _headerSearchBar.barTintColor = [UIColor whiteColor];
        _headerSearchBar.placeholder = @"请输入...";
        /*
         2.设置边框颜色和圆角(通过KVC的方法获得UISearchBar的私有变量searchField(UITextField类型),所以设置search的边框就是设置了UITextField的边框)
         */
        UITextField *searchField = [self.headerSearchBar valueForKey:@"searchField"];
        if(searchField)
        {
            [searchField setBackgroundColor:[UIColor whiteColor]];
            searchField.layer.cornerRadius = 12.5;
            searchField.layer.borderWidth = 3;
            searchField.layer.borderColor = [GVColor hexStringToColor:@"#cccccc"].CGColor;
            searchField.textColor = [UIColor blackColor];
            searchField.font = [UIFont systemFontOfSize:15];
            searchField.layer.masksToBounds = YES;
            //修改光标颜色
            searchField.tintColor = [GVColor hexStringToColor:@"#cccccc"];
        }
    }
    return _headerSearchBar;
}
//购物车控件
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
    [bgImgView sd_setImageWithURL:[NSURL URLWithString:self.store_photo] placeholderImage:[UIImage imageNamed:@"img1"]];
    //设置为高斯模糊
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, bgImgView.frame.size.width, bgImgView.frame.size.height);
    [bgImgView addSubview:effectView];
    [headView addSubview:bgImgView];
    
    //店铺图片
    UIImageView * userImage = [[UIImageView alloc]initWithFrame:CGRectMake(12, 44, 55, 55)];
    [userImage sd_setImageWithURL:[NSURL URLWithString:self.store_photo] placeholderImage:[UIImage imageNamed:@"img1"]];
    userImage.layer.cornerRadius = 26;
    userImage.layer.masksToBounds = YES;
    [headView addSubview:userImage];
    
    //店铺名字
    UILabel * hotelLabel =[[UILabel alloc]initWithFrame:CGRectMake(77, 43, 0, 0)];
    hotelLabel.text =self.store_name;
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
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//    if (tableView == self.sideTableView)
//    {
//       return 1;
//    }
//    else
//    {
//       return _typeArr.count;
//    }
//    
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.sideTableView)
    {
       return sideTitleArr.count;
    }
    else
    {
       return _infoArr.count;
    }
    
}
//headerTitle
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if(tableView == self.hotelTableView)
//        return sideTitleArr[section];
//    return nil;
//}
//选择某行cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断是否为左侧按钮
    if([tableView isEqual:self.sideTableView])
    {
        //计算出右侧tableView将要滚动的位置
        NSIndexPath * sidePath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        //将右侧tableView移动到指定位置
        [self.hotelTableView selectRowAtIndexPath:sidePath animated:YES scrollPosition:UITableViewScrollPositionTop];
        //取消选中效果
        [self.hotelTableView deselectRowAtIndexPath:sidePath animated:YES];
        
        //改变选中时的title颜色
        sideTableViewCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
        cell.sideTitle.textColor = [GVColor hexStringToColor:@"ffba14"];
        
        
    }
    else
    {
        
    }
}
//右边滑动跟左边的联动以及tableViewHear的透明度
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
    //如果是左侧tableView直接return;
//    if(scrollView == self.sideTableView) return;
//    
//    //取出显示在视图最靠上的cell的indePath
//    NSIndexPath * topViewIndexPath = [[self.hotelTableView indexPathsForVisibleRows] firstObject];
//    //左侧的tableView联动indePath
//    NSIndexPath * sidePath = [NSIndexPath indexPathForRow:topViewIndexPath.section inSection:0];
//    //移动左测tableView到指定的indexPath居上显示
//    [self.sideTableView selectRowAtIndexPath:sidePath animated:YES scrollPosition:UITableViewScrollPositionBottom];
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
        [cell setHoteInfo:_infoArr[indexPath.row]];
        NSLog(@"%@",_infoArr);
        
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
        sideCell.sideTitle.text =sideTitleArr[indexPath.row];
        sideCell.selectionStyle = 0;
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
#pragma mark -- 初始化tableView
//左侧tableView
-(UITableView *)sideTableView
{
    if(_sideTableView == nil)
    {
        _sideTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, -235, HeightBounds) style:UITableViewStylePlain];
        _sideTableView.delegate =self;
        _sideTableView.dataSource =self;
        _sideTableView.tableHeaderView = [self sideHeaderView];
        //设置UITableView背景色为图片
        _sideTableView.backgroundColor= [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"peking"]];
        _sideTableView.backgroundView = imageView;
    }
    return _sideTableView;
}
//右侧tableView
-(UITableView *)hotelTableView
{
    if(_hotelTableView == nil)
    {
        _hotelTableView = [[UITableView alloc]initWithFrame:CGRectMake(ZeroFrame, -20, WidthBounds, HeightBounds) style:UITableViewStylePlain];
        _hotelTableView.delegate = self;
        _hotelTableView.dataSource =self;
        _hotelTableView.tableHeaderView = [self headNavigation];//头视图
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
