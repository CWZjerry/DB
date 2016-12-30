//
//  MySelfViewController.m
//  点吧
//
//  Created by Pro on 2016/12/26.
//  Copyright © 2016年 OneGroup. All rights reserved.
//
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#import "MySelfViewController.h"
#import "LoginViewController.h"
#import "GVColor.h"
#import "UIView+Addition.h"
@interface MySelfViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *TableView;

@property (nonatomic, strong) UIView *headView;


@property (nonatomic, strong) NSArray *listArr;

@property (nonatomic, strong) NSArray *slistArr;

@property (nullable ,strong) UIButton *topLine;

@property (nonatomic ,strong) UIButton *middleLine;

@end

@implementation MySelfViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    
    _listArr = [NSArray arrayWithObjects:@"我的积分",@"我的收货地址", nil];
    _slistArr = [NSArray arrayWithObjects:@"加盟合作",@"关于我们",@"意见反馈", nil];
  
    
    
    [self setTableView];
    
    
}

-(void)setTableView{
    _TableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //    _TableView.backgroundColor = [UIColor whiteColor];
    _TableView.dataSource = self;
    _TableView.delegate = self;
    //    _TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _TableView.showsVerticalScrollIndicator = YES;
    //    _TableView.rowHeight = 86;
    [_TableView setTableHeaderView:self.headView];
    
    //tableView的加头视图
    _TableView.tableHeaderView = [self headViewW];
    //    [_TableView setTableFooterView:self.footView];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:_TableView];
    
    
}

#pragma mark -- TableViewDeletage & Datasouth
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _listArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return _listArr.count;
    }
    else if (section == 1)
    {
        return _slistArr.count;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identifier = @"identifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell== nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = _listArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15 weight:0];
        cell.textLabel.textColor = [UIColor colorWithRed:199/255.0 green:199/255.0 blue:199/255.0 alpha:1.0];
        
    }else{
        cell.textLabel.text = _slistArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15 weight:0];
        cell.textLabel.textColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1.0];
        
    }
    return cell;
 
}

-(UIView *)headViewW{
    
    
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth, 290)];
    self.headView.backgroundColor = [UIColor whiteColor];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width , 164)];
    image.image = [UIImage imageNamed:@"background_"];
    [self.headView addSubview:image];
    
    
    UIButton *headBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 41.5, 54, 83, 83)];
    [headBtn setBackgroundColor:[UIColor lightGrayColor]];
    headBtn.layer.cornerRadius = 41.5;
    headBtn.layer.masksToBounds = YES;
    [headBtn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(LoginInBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:headBtn];
    
    UILabel *headLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 153, ScreenWidth - 20, 20)];
    headLabel.text = @"登录/注册";
    headLabel.textAlignment = NSTextAlignmentCenter;
    headLabel.textColor = [UIColor colorWithHue:0.00 saturation:0.00 brightness:0.00 alpha:1.00];
    headLabel.font = [UIFont systemFontOfSize:17 weight:1.5];
    [self.headView addSubview:headLabel];
    
   _middleLine = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/2,  200, 0.5, 56)];
    [_middleLine setBackgroundColor:[UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1.0]];
    [self.headView addSubview:_middleLine];
    
    _topLine=[[UIButton alloc]initWithFrame:CGRectMake(0, 193, ScreenWidth, 0.5)];
    [_topLine setBackgroundColor:[UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:0.5]];
    [self.headView addSubview:_topLine];
    
    UIButton *purseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth/2, 84)];
    UIImageView *purseImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2-110, _topLine.bottom + 10 , 33, 28)];
    
    purseImage.image = [UIImage imageNamed:@"wallet"];
    [purseBtn addSubview:purseImage];
    
    UILabel *purseLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _topLine.bottom + 10 + 28 + 13, ScreenWidth/2 - 20, 20)];
    purseLabel.text = @"我的钱包";
    purseLabel.textAlignment = NSTextAlignmentCenter;
    purseLabel.textColor = [GVColor hexStringToColor:@"888888"];
//    purseLabel.font = [UIFont systemFontOfSize:17 weight:1.5];
    [purseBtn addSubview:purseLabel];

    [self.headView addSubview:purseBtn];
    


    
    //
    //
    //
    //        [purseBtn setTitle:@"我的钱包" forState:UIControlStateNormal];
    //        [purseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //        [purseBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //        purseBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    //        [self.headView addSubview:purseBtn];
    //
    //        UIButton * discountBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/4*3 - 40, headLabel.bottom + 20, 80, 20)];
    //        [discountBtn setTitle:@"我的优惠券" forState:UIControlStateNormal];
    //        [discountBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //        [discountBtn addTarget:self action:@selector(LoginInBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //        discountBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    //        [self.headView addSubview:discountBtn];
    //
    
    UIButton *discountBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2+10, _topLine.bottom + 5, ScreenWidth/2, 84)];
//    discountBtn.backgroundColor = [UIColor grayColor];
    [self.headView addSubview:discountBtn];
    
    
    
    
    
    
    
    
    
    
    
    
    return self.headView;
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

//    self.footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
//    label.text = @"version 2.7.0 build 1305";
//    label.font = [UIFont systemFontOfSize:12.f];
//    label.textColor = [UIColor grayColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    [self.footView addSubview:label];

//    return self.footView;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}



-(void)LoginInBtnClick{
    
    
    LoginViewController *login = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
