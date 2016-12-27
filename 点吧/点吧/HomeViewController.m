//
//  HomeViewController.m
//  点吧
//
//  Created by Pro on 2016/12/26.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "HomeViewController.h"

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
