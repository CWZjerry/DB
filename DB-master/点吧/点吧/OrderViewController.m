//
//  OrderViewController.m
//  点吧
//
//  Created by Pro on 2016/12/26.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "OrderViewController.h"
#import "TopScroll.h"
#import "TotalViewController.h"
#import "HallViewController.h"
#import "TakeViewController.h"
#import "AFNManager.h"
#import <YYModel.h>
#import "Order.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface OrderViewController ()<TopScrollDelagate,UIScrollViewDelegate>
@property(nonatomic,strong)TopScroll *topscroll;
@property(nonatomic,strong)UIScrollView * bottomScroll;
@property(nonatomic,strong)NSMutableArray * titleArr;
@property(nonatomic,strong)NSMutableArray * messageArr;
@end

@implementation OrderViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.tabBarController.tabBar.translucent = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    self.navigationItem.title = @"我的订单";
    
    [self addAllChildViewController];
    [self.view addSubview:self.topscroll];
    [self.view addSubview:self.bottomScroll];
    [self.view insertSubview:_bottomScroll belowSubview:_topscroll];
    [self loadData];
}
//模型数组
-(NSMutableArray *)messageArr
{
    if (_messageArr == nil) {
        _messageArr = [NSMutableArray array];
    }
    return _messageArr;
}
//加载数据
-(void)loadData
{
}
//标题数组
-(NSMutableArray *)titleArr
{
    if (_titleArr == nil) {
        _titleArr = [NSMutableArray arrayWithObjects:@"全部",@"食堂",@"外卖", nil];
    }
    return _titleArr;
}
//顶部滚动
-(TopScroll *)topscroll
{
    if (_topscroll == nil) {
        _topscroll = [[TopScroll alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40) withTitleArr:self.titleArr];
        _topscroll.TopDelegate = self;
    }
    return _topscroll;
}
//底部滚动
-(UIScrollView *)bottomScroll
{
    if (_bottomScroll == nil) {
        _bottomScroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _bottomScroll.contentSize=CGSizeMake(WIDTH*self.titleArr.count, HEIGHT);
        _bottomScroll.pagingEnabled=YES;
        _bottomScroll.bounces = NO;
        _bottomScroll.showsHorizontalScrollIndicator = NO;
        _bottomScroll.delegate=self;
        UIViewController*viewC=self.childViewControllers[0];
        [_bottomScroll addSubview:viewC.view];
    }
    return _bottomScroll;
}
//添加子控制器
-(void)addAllChildViewController
{
    TotalViewController * total = [[TotalViewController alloc]init];
    [self addChildViewController:total];
    HallViewController * hall = [[HallViewController alloc]init];
    [self addChildViewController:hall];
    TakeViewController * take = [[TakeViewController alloc]init];
    [self addChildViewController:take];
    
}
#pragma mark -  显示对应的视图
-(void)showViewControlle:(NSInteger)index
{
    //    UIPageViewController
    UIViewController*viewC=self.childViewControllers[index];
    
    if ([viewC isViewLoaded]) {
        return;
    }
    
    [self.bottomScroll addSubview:viewC.view];
    viewC.view.frame=CGRectMake(index*WIDTH, 0, WIDTH, HEIGHT);
}
//通过下标判断加载视图
- (void)selectTitleAtIndex:(NSInteger)index
{
    [self showViewControlle:index];
    
    self.bottomScroll.contentOffset=CGPointMake(index*WIDTH, 0);
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    [self showViewControlle:index];
    UIButton*bth=self.topscroll.titleArr[index];
    [self.topscroll selectTitleCente:bth];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
