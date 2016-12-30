//
//  DetailsViewController.m
//  点吧
//
//  Created by Pro on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsHead.h"
#import "DetailsMessage.h"
#import "GVColor.h"
#import "VegeTableViewCell.h"
#import "CostTableViewCell.h"
#import "GVColor.h"
#import "MoneyView.h"
#import <UIView+SDAutoLayout.h>
#import "DetailsView.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface DetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-120) style:UITableViewStylePlain];
        _tableView.dataSource =self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
//尾视图
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
//    if (section == 2) {
//        
//    }
//    else{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [GVColor hexStringToColor:@"#f2f2f2"];
    return view;
//    }
    
}
//头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        DetailsHead  *detail = [[DetailsHead alloc]init];//WithFrame:CGRectMake(0, 0, WIDTH, 63)];
        return detail;
    }
    else if (section ==1)
    {
        DetailsMessage *message = [[DetailsMessage alloc]init];
        return message;
    }
    else if (section == 4)
    {
        DetailsView *view = [[DetailsView alloc]init];
        return view;
        
    }
    else if (section == 5)
    {
        DetailsView *view = [[DetailsView alloc]init];
        view.details.text = @"配送信息";
        return view;
    }
    else
    {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [GVColor hexStringToColor:@"#f2f2f2"];
        return view;}
}
//头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 63;
    }
    else if(section == 2)
    {
        return 0;
    }
    else if (section == 3)
    {
        return 0;
    }
    else if (section == 4)
    {
        return 40;
    }
    else if (section == 5)
    {
        return 40;
    }
    else if (section == 1)
    {
        return 40;
    }
    else
    {
        return 0;
    }
}
//尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 10;
    }
    else if(section == 2)
    {
        return 1;
    }
    else if(section == 3)
    {
        return 10;
    }
    else if(section == 1)
    {
        return 0;
    }
    else{
        return 0;
    }
}
//单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 0;
    }
    else if (indexPath.section == 3)
    {
        return 42;
    }
    else
    {
        return 28;
    }
}
//分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
//单元格数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return 1;
            break;
            
            
        default:
            return 3;
            break;
    }

}

//单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        VegeTableViewCell *cell = [[VegeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        return cell;
    }
    else if (indexPath.section == 2)
    {
        CostTableViewCell *cell = [[CostTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        if (indexPath.row == 2) {
            cell.freight.textColor =[GVColor hexStringToColor:@"#ff1e00"];
            cell.money.textColor =[GVColor hexStringToColor:@"#ff1e00"];
        }
        cell.money.text = @"sadas";
        return cell;
    }
    else if (indexPath.section == 3)
    {
        MoneyView *cell = [[MoneyView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        return cell;
    }
    
    return [[UITableViewCell alloc]init];;
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
