//
//  TotalViewController.m
//  点吧
//
//  Created by Pro on 2016/12/27.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "TotalViewController.h"
#import "TotalTableViewCell.h"
<<<<<<< HEAD
#import "DetailsViewController.h"
#import "Order.h"
#import "AFNManager.h"
#import <YYModel.h>
=======
>>>>>>> 34313a9944d89370503d9df90f40e1a66d0cd408
@interface TotalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray * messageArr;
@end

@implementation TotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-154) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
}
//模型数组
-(NSMutableArray *)messageArr
{
    if (_messageArr == nil) {
        _messageArr = [NSMutableArray array];
    }
    return _messageArr;
}
-(void)loadData
{
    NSDictionary *dic = @{@"user_id":@"10001",
                          @"type":@"1",
                          @"page":@"1"
                          };
    NSString * str = @"http://www.kdiana.com/index.php/Before/MyOrder/orderall";
    
    [[AFNManager sharedManager]requestType:POST URL:str withparameters:dic success:^(id data) {
        //        NSLog(@"%@",data);
        NSArray *arr =[data objectForKey:@"data"];
        NSLog(@"%@",arr);
        for (NSDictionary *dic  in arr) {
            Order *order = [Order yy_modelWithJSON:dic];
            [self.messageArr addObject:order];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    TotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TotalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Order *order = self.messageArr[indexPath.row];
    cell.shopNameLab.text = order.eat_type;
//    cell.payLab.text = @"已付款";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
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
