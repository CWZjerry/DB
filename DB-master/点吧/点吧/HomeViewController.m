//
//  HomeViewController.m
//  点吧
//
//  Created by Pro on 2016/12/26.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "HomeViewController.h"
#import "JZSearchBar.h"
#import "UIImage+JZ.h"
#import "GVColor.h"
#import "HomeTableViewCell.h"
#import "HomeView.h"
#import "UILabel+LabelFrame.h"
#import <SDCycleScrollView.h>
#import "headerCollectionViewCell.h"
#import "PopoverView.h"
#import "hotelViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate>
{
    HomeView * _homeView;
    UIView * _headerView;
    NSArray * _headerArr;
    UIView * _navView;//导航栏view
}
@property(nonatomic,strong) UICollectionView * headerCollection;
@property(nonatomic,strong) SDCycleScrollView * headerSDC;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate=self;
    
    _headerArr = @[@"img1",@"img2",@"img4"];
    
    [self HomeTableView];
   
    [self BarButtonItem];
}
#pragma mark -- 视图将要出现时
-(void)viewWillAppear:(BOOL)animated
{
    //隐藏导航栏
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    //在导航栏上添加View
    _navView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 64)];
    _navView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:_navView];
    [self searchBar];
}
#pragma mark -- UISearchBar
-(void)searchBar
{
    //搜索条
    JZSearchBar * searchBar = [JZSearchBar searchBar];
    searchBar.frame = CGRectMake(85,29,230,26);
    [_navView addSubview:searchBar];
}
-(void)leftBtn
{
    
}
#pragma mark --UIBarButtonItem
-(void)BarButtonItem
{
    //导航栏右侧按钮且保持原色
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(addItemmmClick:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [self.navigationItem.rightBarButtonItem setImage:[[UIImage imageNamed:@"more"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //左侧按钮
    UIButton *b=[UIButton buttonWithType:UIButtonTypeCustom];
    b.frame=CGRectMake(12, 10, 60, 30);
    [b setTitle:@"北京" forState: UIControlStateNormal];
    [b.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [b setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [b setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    b.imageEdgeInsets=UIEdgeInsetsMake(10,40, 9, 0);
    b.titleEdgeInsets=UIEdgeInsetsMake(10, -40, 9, 0);
    
    [b addTarget:self action:@selector(city) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:b];
}
-(void)city
{
 
}
//左上角➕号弹出
-(void)addItemmmClick:(UIBarButtonItem *)sender
{
    //扫一扫
    PopoverAction * sweepAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"scan"] title:@"扫一扫" handler:^(PopoverAction *action) {
        
        
    }];
    //付款码
    PopoverAction * PaymentAction =[PopoverAction actionWithImage:[UIImage imageNamed:@"code"] title:@"付款码" handler:^(PopoverAction *action) {
        
        
    }];
    //登录
    PopoverAction * loginAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"mine_down"] title:@"登录" handler:^(PopoverAction *action) {
        
        
    }];
    
    PopoverView * popView = [PopoverView popoverView];
    //颜色风格
    popView.style = PopoverViewStyleDark;
    popView.showShade = YES;//是否显示阴影
    popView.hideAfterTouchOutside = YES;//点击外部是否隐藏提示框
    //加载到指定的点
    [popView showToPoint:CGPointMake(WidthBounds-20, 64) withActions:@[sweepAction,PaymentAction,loginAction]];
}

#pragma mark -- header视图
//头视图
-(UIView *)homeHeaderView
{
    //头视图View
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, self.view.frame.size.width, 505)];
    //_headerView.backgroundColor = [UIColor redColor];
    //加滚动视图
    [_headerView addSubview:self.headerSDC];
    //加collectionView
    [_headerView addSubview:self.headerCollection];
    
    
    [self RestaurantLabel];
    [self RestaurantButton];
    
    return _headerView;
}
#pragma mark -- 6个label
-(void)RestaurantLabel
{
    //1
    UILabel *labelLeftTWO =[[UILabel alloc]initWithFrame:CGRectMake(12, 174, 118, 0.5)];
    labelLeftTWO.backgroundColor = [GVColor hexStringToColor:@"#cccccc"];
    [_headerView addSubview:labelLeftTWO];
    //2
    UILabel *labelCentralTWO =[[UILabel alloc]initWithFrame:CGRectMake(146, 36, 118, 0.5)];
    labelCentralTWO.textColor = [GVColor hexStringToColor:@"#333333"];
    labelCentralTWO.text = @"热门推荐";
    labelCentralTWO.font = [UIFont systemFontOfSize:18];
    //自适应宽高
    CGFloat widthTWO = [UILabel getWidthWithTitle:labelCentralTWO.text font:labelCentralTWO.font];
    labelCentralTWO.frame = CGRectMake(146, 168, widthTWO, 17);
    [_headerView addSubview:labelCentralTWO];
    //3
    UILabel *labelRightTWO =[[UILabel alloc]initWithFrame:CGRectMake(230, 174, 118, 0.5)];
    labelRightTWO.backgroundColor = [GVColor hexStringToColor:@"#cccccc"];
    [_headerView addSubview:labelRightTWO];
    //下3个lable
    //4
    UILabel *labelLeft =[[UILabel alloc]initWithFrame:CGRectMake(12, 453, 118, 0.5)];
    labelLeft.backgroundColor = [GVColor hexStringToColor:@"#cccccc"];
    [_headerView addSubview:labelLeft];
    //5
    UILabel *labelCentral =[[UILabel alloc]initWithFrame:CGRectMake(146, 453, 118, 0.5)];
    labelCentral.textColor = [GVColor hexStringToColor:@"#333333"];
    labelCentral.text = @"附近餐吧";
    labelCentral.font = [UIFont systemFontOfSize:18];
    //自适应宽高
    CGFloat width = [UILabel getWidthWithTitle:labelCentral.text font:labelCentral.font];
    labelCentral.frame = CGRectMake(146, 443, width, 17);
    [_headerView addSubview:labelCentral];
    //6
    UILabel *labelRight =[[UILabel alloc]initWithFrame:CGRectMake(230, 453, 118, 0.5)];
    labelRight.backgroundColor = [GVColor hexStringToColor:@"#cccccc"];
    [_headerView addSubview:labelRight];
}

#pragma mark -- 三个按钮(全部,附近,综合排序)
-(void)RestaurantButton
{
    UIButton *allBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    allBtn.frame=CGRectMake(20, 473, 60, 30);
    allBtn.tag = 1001;
    [allBtn setTitle:@"全部" forState: UIControlStateNormal];
    [allBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [allBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [allBtn setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    allBtn.imageEdgeInsets=UIEdgeInsetsMake(10,40, 9, 0);
    allBtn.titleEdgeInsets=UIEdgeInsetsMake(10, -40, 9, 0);
    [allBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:allBtn];
    
    
    UIButton *NearbyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    NearbyBtn.frame=CGRectMake(WidthBounds/2-25, 473, 60, 30);
    NearbyBtn.tag = 1002;
    [NearbyBtn setTitle:@"附近" forState: UIControlStateNormal];
    [NearbyBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [NearbyBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [NearbyBtn setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    NearbyBtn.imageEdgeInsets=UIEdgeInsetsMake(10,40, 9, 0);
    NearbyBtn.titleEdgeInsets=UIEdgeInsetsMake(10, -40, 9, 0);
    [NearbyBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:NearbyBtn];
    
    UIButton *synthesisBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    synthesisBtn.frame=CGRectMake(WidthBounds/2+105, 473, 60, 30);
    synthesisBtn.tag = 1003;
    [synthesisBtn setTitle:@"综合排序" forState: UIControlStateNormal];
    [synthesisBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [synthesisBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [synthesisBtn setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    synthesisBtn.imageEdgeInsets=UIEdgeInsetsMake(10,70, 9, 0);
    synthesisBtn.titleEdgeInsets=UIEdgeInsetsMake(10, -30, 9, 0);
    [synthesisBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:synthesisBtn];
    
}
//全部
- (NSArray<PopoverAction *> *)QQActions {
    
    PopoverAction *oneAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_multichat"] title:@"火锅" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *twoAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_addFri"] title:@"小吃快餐" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *threeAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_QR"] title:@"自助餐" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *forAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_facetoface"] title:@"烧烤烤肉" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *fiveAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"甜品饮品" handler:^(PopoverAction *action) {
        
    }];
    PopoverAction *sixAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"甜品饮品" handler:^(PopoverAction *action) {
        
    }];
    PopoverAction *sevenAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"甜品饮品" handler:^(PopoverAction *action) {
        
    }];
    PopoverAction *eightAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"甜品饮品" handler:^(PopoverAction *action) {
        
    }];
    PopoverAction *nineAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"甜品饮品" handler:^(PopoverAction *action) {
        
    }];
    return @[oneAction,twoAction,threeAction,forAction,fiveAction,sixAction,sevenAction,eightAction,nineAction];
}
- (NSArray<PopoverAction *> *)nearbyActions
{
    PopoverAction *oneAction = [PopoverAction actionWithImage:nil title:@"附近" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *twoAction = [PopoverAction actionWithImage:nil title:@"100米以内" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *threeAction = [PopoverAction actionWithImage:nil title:@"300米以内" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *forAction = [PopoverAction actionWithImage:nil title:@"1千米以内" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *fiveAction = [PopoverAction actionWithImage:nil title:@"3千米以内" handler:^(PopoverAction *action) {
        
    }];
    
    return @[oneAction,twoAction,threeAction,forAction,fiveAction];
}
- (NSArray<PopoverAction *> *)synthesizeAction
{
    PopoverAction *oneAction = [PopoverAction actionWithImage:nil title:@"综合排序" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *twoAction = [PopoverAction actionWithImage:nil title:@"销售从高到低" handler:^(PopoverAction *action) {
        
    }];
    
    PopoverAction *threeAction = [PopoverAction actionWithImage:nil title:@"好评从高到低" handler:^(PopoverAction *action) {
        
    }];
    return @[oneAction,twoAction,threeAction];
}
//点击三个按钮事件
-(void)ClickBtn:(UIButton *)btn
{
    if(btn.tag == 1001)
    {
        PopoverView *popoverView = [PopoverView popoverView];
        popoverView.showShade = YES;//是否显示阴影
        [popoverView showToView:btn withActions:[self QQActions]];
    }
    else if (btn.tag == 1002)
    {
        PopoverView *popoverView = [PopoverView popoverView];
        popoverView.showShade = YES;//是否显示阴影
        [popoverView showToView:btn withActions:[self nearbyActions]];
    }
    else
    {
        PopoverView *popoverView = [PopoverView popoverView];
        popoverView.showShade = YES;//是否显示阴影
        [popoverView showToView:btn withActions:[self synthesizeAction]];
    }
}

#pragma mark -- 下面是tableView
//头滚动视图
-(SDCycleScrollView *)headerSDC
{
    if(_headerSDC == nil)
    {
        _headerSDC=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(ZeroFrame, ZeroFrame, self.view.frame.size.width, 150) imageNamesGroup:_headerArr];
        //开启用户交互
        _headerSDC.userInteractionEnabled=YES;
        //关闭.
        _headerSDC.showPageControl = NO;
        _headerSDC.delegate=self;
    }
    return _headerSDC;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    hotelViewController *hote = [[hotelViewController alloc]init];
    //跳转时候讲返回按钮设置为""
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:hote animated:YES];
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93;
}
//每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * homeStr = @"HomeTableViewCell";
    HomeTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:homeStr];
    //取消选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//初始化tableView
-(void)HomeTableView
{
    _homeView = [[HomeView alloc]initWithFrame:self.view.frame];
    self.view = _homeView;
    _homeView.homeTableView.delegate =self;
    _homeView.homeTableView.dataSource= self;
    //隐藏滚动条
    _homeView.homeTableView.showsVerticalScrollIndicator =
    NO;
    //头视图
    _homeView.homeTableView.tableHeaderView = [self homeHeaderView];
    //注册cell
    [_homeView.homeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"HomeTableViewCell"];
}

#pragma mark -- 下面是collectionView

//collectionView布局
-(UICollectionViewFlowLayout *)layout
{
    UICollectionViewFlowLayout * layout =[[UICollectionViewFlowLayout alloc]init];
    //设定滚动方向(水平)
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(ZeroFrame, 5, 0, 10);
    return layout;
}
//单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(145, 212);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
//每个section中cell的数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * collectionViewSTR = @"headerCollectionViewCell";
    headerCollectionViewCell * headerCell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewSTR forIndexPath:indexPath];
    headerCell.imageTitle.image = [UIImage imageNamed:_headerArr[indexPath.row]];
    return headerCell;
}
//初始化collectionView
-(UICollectionView *)headerCollection
{
    if(_headerCollection == nil)
    {
        _headerCollection= [[UICollectionView alloc]initWithFrame:CGRectMake(ZeroFrame, 210, WidthBounds, 212) collectionViewLayout:[self layout]];
        _headerCollection.delegate = self;
        _headerCollection.dataSource = self;
        //隐藏水平滚动条
        _headerCollection.showsHorizontalScrollIndicator=NO;
        _headerCollection.backgroundColor = [UIColor clearColor];
        //注册单元格
        [_headerCollection registerClass:[headerCollectionViewCell class] forCellWithReuseIdentifier:@"headerCollectionViewCell"];
    }
    return _headerCollection;
}

@end
