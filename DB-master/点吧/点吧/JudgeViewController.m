//
//  JudgeViewController.m
//  点吧
//
//  Created by Pro on 2016/12/31.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "JudgeViewController.h"
#import "MessagView.h"
#import "UILabel+OGLabel.h"
#import <UIView+SDAutoLayout.h>
#import "GVColor.h"
#define BLACK @"#333333"
#import "JudgeVegeTableViewCell.h"
@interface JudgeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIButton *subMitBtn;

@end

@implementation JudgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.bottomView];
    _bottomView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(70);
    [self.bottomView addSubview:self.subMitBtn];
    _subMitBtn.sd_layout
    .topSpaceToView(self.bottomView,25)
    .widthIs(170)
    .heightIs(30)
    .centerXEqualToView(self.bottomView);
}
-(UIButton *)subMitBtn
{
    if (_subMitBtn == nil) {
        _subMitBtn = [[UIButton alloc]init];
        [_subMitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_subMitBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
        _subMitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _subMitBtn.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
        _subMitBtn.layer.masksToBounds = YES;
        _subMitBtn.layer.cornerRadius = 7;
    }
    return _subMitBtn;
}
-(UIView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.delegate= self;
        _tableview.dataSource= self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.scrollEnabled = NO;
    }
    return _tableview;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 113;
    }
    else if(indexPath.section == 1)
    {
        return 30;
    }
    else
    {
        return 130;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
            
        default:
            return 1;
            break;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *view = [[UIView alloc]init];
        UILabel *line = [[UILabel alloc]init];
        line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        [view addSubview:line];
        line.sd_layout
        .leftSpaceToView(view,12)
        .topEqualToView(view)
        .rightSpaceToView(view,12)
        .heightIs(1);
        UILabel *lable = [[UILabel alloc]initWithText:@"菜品评价" font:[UIFont systemFontOfSize:17] textColor:[GVColor hexStringToColor:BLACK]];
        [view addSubview:lable];
        lable.sd_layout
        .leftEqualToView(line)
        .topSpaceToView(line,15)
        .bottomSpaceToView(view,6)
        .widthIs(100);
        return view;
    }
    else
    {
        UIView *view = [[UIView alloc]init];
        UILabel *line = [[UILabel alloc]init];
        line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        [view addSubview:line];
        line.sd_layout
        .leftSpaceToView(view,12)
        .topEqualToView(view)
        .rightSpaceToView(view,12)
        .heightIs(1);
        UILabel *lable = [[UILabel alloc]initWithText:@"总体评价" font:[UIFont systemFontOfSize:17] textColor:[GVColor hexStringToColor:BLACK]];
        [view addSubview:lable];
        lable.sd_layout
        .leftEqualToView(line)
        .topSpaceToView(line,15)
        .bottomSpaceToView(view,6)
        .widthIs(100);
        return view;
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    else
    {
        return 46;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ) {
        MessagView * message = [[MessagView alloc]init];
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        [cell.contentView addSubview:message];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    else if(indexPath.section == 1)
    {
        JudgeVegeTableViewCell *cell = [[JudgeVegeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    
    
    else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        UITextView *textView = [[UITextView alloc]init];
        textView.backgroundColor = [UIColor orangeColor];
        [cell.contentView addSubview:textView];
        textView.sd_layout
        .leftSpaceToView(cell.contentView,12)
        .widthIs([UIScreen mainScreen].bounds.size.width - 24)
        .heightIs(130);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.view addSubview:self.tableview];
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

