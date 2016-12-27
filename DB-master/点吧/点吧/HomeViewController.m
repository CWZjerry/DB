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
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    HomeView * _homeView;
    UIView * _headerView;
}
@property(nonatomic,strong) UIScrollView * headerScrollView;
@property(nonatomic,strong) UICollectionView * headerCollection;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self HomeTableView];
    [self searchBar];
    [self BarButtonItem];
    
}
#pragma mark -- UISearchBar
-(void)searchBar
{
    //搜索条
    JZSearchBar * searchBar = [JZSearchBar searchBar];
    searchBar.frame = CGRectMake(85,29,230,26);
    [self.navigationController.view addSubview: searchBar];
}

#pragma mark --UIBarButtonItem
-(void)BarButtonItem
{
    //导航栏右侧按钮且保持原色
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(addItemmmClick)];
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
    
    //[b addTarget:self action:@selector(come) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:b];
}
-(void)registerClick:(UIBarButtonItem *)bar
{
    
}
-(void)addItemmmClick
{
    
}


-(void)HomeTableView
{
    _homeView = [[HomeView alloc]initWithFrame:self.view.frame];
    self.view = _homeView;
    _homeView.homeTableView.delegate =self;
    _homeView.homeTableView.dataSource= self;
    
    //头视图
    _homeView.homeTableView.tableHeaderView = [self homeHeaderView];
    
    [_homeView.homeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"HomeTableViewCell"];
}
//头视图
-(UIView *)homeHeaderView
{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 423)];
    _headerView.backgroundColor = [UIColor redColor];
    [_headerView addSubview:self.headerScrollView];
    
    UILabel *labelLeft =[[UILabel alloc]initWithFrame:CGRectMake(12, 24, 118, 0.5)];
    labelLeft.backgroundColor = [GVColor hexStringToColor:@"#cccccc"];
    [_headerView addSubview:labelLeft];
    
    
    UILabel *labelCentral =[[UILabel alloc]initWithFrame:CGRectMake(140, 36, 118, 0.5)];
    labelCentral.backgroundColor = [GVColor hexStringToColor:@"#333333"];
    [_headerView addSubview:labelCentral];
    
    
    return _headerView;
}
//头视图滚动视图
-(UIScrollView *)headerScrollView
{
    if(_headerScrollView ==nil)
    {
        _headerScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
        _headerScrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
        _headerScrollView.pagingEnabled=YES;
        _headerScrollView.backgroundColor = [UIColor blueColor];
    }
    return _headerScrollView;
}

#pragma mark -- collectionView
//-(UICollectionView *)headerCollection
//{
//    if(_headerCollection == nil)
//    {
//        _headerCollection= [UICollectionView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>) collectionViewLayout:<#(nonnull UICollectionViewLayout *)#>
//    }
//}
#pragma mark -- tableViewDataSoure
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
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
    return cell;
    
}


@end
