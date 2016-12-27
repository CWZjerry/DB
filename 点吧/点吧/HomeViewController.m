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
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate =self;
    self.tableView.dataSource= self;
    [self.view addSubview: self.tableView];
    
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc]init];
    
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
