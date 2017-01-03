//
//  TakeAwayViewController.m
//  点吧
//
//  Created by Pro on 2016/12/26.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "TakeAwayViewController.h"
#import "takeAwayCell.h"
#import "hotelViewController.h"
#import "homeRequest.h"
@interface TakeAwayViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * _tableArr;
}
@property(nonatomic,strong) UIView * headerView;
@property(nonatomic,strong) UITableView *takeTableView;
@end

@implementation TakeAwayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self MJRefreshTableView];
    self.title = @"外卖";
    [self.view addSubview:self.takeTableView];
    [self.view addSubview:self.headerView];
    [self RestaurantButton];
}
#pragma mark -- MJRefresh刷新
-(void)MJRefreshTableView
{
    //上拉刷新
    self.takeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [homeRequest GetWithRequest:^(id Value, id img, id hot) {
            _tableArr = Value;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.takeTableView.mj_header endRefreshing];
                [self.takeTableView reloadData];
                
            });
            
        } failure:^(id failure) {
        }];
    }];
    //下拉刷新
    self.takeTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        //请求网络
        //当网络请求完毕刷新表格
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.takeTableView.mj_footer endRefreshing];//结束加载表格数据
            [self.takeTableView reloadData];
        });
    }];
    //马上进入刷新状态
    [self.takeTableView.mj_header beginRefreshing];
}

-(UIView *)headerView
{
    if(_headerView == nil)
    {
        _headerView= [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, 64, WidthBounds, 40)];
        _headerView.backgroundColor = [UIColor whiteColor];
        
        UIView * base = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, 39, WidthBounds, 0.5)];
        base.backgroundColor = [GVColor hexStringToColor:@"cccccc"];
        [_headerView addSubview:base];
    }
    return _headerView;
}
-(void)RestaurantButton
{
    UIButton *allBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    allBtn.frame=CGRectMake(20, 5, 60, 30);
    allBtn.tag = 1001;
    [allBtn setTitle:@"全部" forState: UIControlStateNormal];
    [allBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [allBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [allBtn setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    allBtn.imageEdgeInsets=UIEdgeInsetsMake(10,40, 9, 0);
    allBtn.titleEdgeInsets=UIEdgeInsetsMake(10, -40, 9, 0);
    [allBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:allBtn];
    
    UIButton *NearbyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    NearbyBtn.frame=CGRectMake(WidthBounds/2-25, 5, 60, 30);
    NearbyBtn.tag = 1002;
    [NearbyBtn setTitle:@"附近" forState: UIControlStateNormal];
    [NearbyBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [NearbyBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [NearbyBtn setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    NearbyBtn.imageEdgeInsets=UIEdgeInsetsMake(10,40, 9, 0);
    NearbyBtn.titleEdgeInsets=UIEdgeInsetsMake(10, -40, 9, 0);
    [NearbyBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:NearbyBtn];
    
    UIButton *synthesisBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    synthesisBtn.frame=CGRectMake(WidthBounds/2+105, 5, 60, 30);
    synthesisBtn.tag = 1003;
    [synthesisBtn setTitle:@"综合排序" forState: UIControlStateNormal];
    [synthesisBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [synthesisBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [synthesisBtn setImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    synthesisBtn.imageEdgeInsets=UIEdgeInsetsMake(10,70, 9, 0);
    synthesisBtn.titleEdgeInsets=UIEdgeInsetsMake(10, -30, 9, 0);
    [synthesisBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:synthesisBtn];
    
   
}
-(void)ClickBtn:(UIButton *)btn
{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    hotelViewController *hote = [[hotelViewController alloc]init];
    hote.hidesBottomBarWhenPushed = YES;//隐藏标签栏
    [self.navigationController pushViewController:hote animated:YES];
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93;
}
//每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * takeStr = @"takeAwayCell";
    takeAwayCell * cell =[tableView dequeueReusableCellWithIdentifier:takeStr];
    [cell setHomeInfo:_tableArr[indexPath.row]];
    //取消选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(UITableView *)takeTableView
{
    if(_takeTableView == nil)
    {
        _takeTableView = [[UITableView alloc]initWithFrame:CGRectMake(ZeroFrame, 44, WidthBounds, HeightBounds) style:UITableViewStylePlain];
        _takeTableView .delegate=self;
        _takeTableView .dataSource=self;
         [_takeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([takeAwayCell class]) bundle:nil] forCellReuseIdentifier:@"takeAwayCell"];
    }
    return _takeTableView;
}
@end
