//
//  cooperationController.m
//  点吧
//
//  Created by Jenny on 2017/1/2.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "cooperationController.h"

@interface cooperationController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *TableView;
@property (nonatomic, strong) NSArray *listArr;

@property (nonatomic, strong) NSArray *slistArr;
@end

@implementation cooperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor =[UIColor whiteColor];
    _listArr = [NSArray arrayWithObjects:@"商家加盟",@"骑士加盟", nil];
    _slistArr = [NSArray arrayWithObjects:@"代理加盟", nil];
    [self setTableView];
    [self setNav];
}
-(void)setNav{
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"加盟合作";
    //导航字体颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    // 设置导航默认标题的颜色及字体大小
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor blackColor], UITextAttributeFont:[UIFont boldSystemFontOfSize:20]};
    
    //导航添加的按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    // 导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:[GVColor hexStringToColor:@"ffba14"]];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItem=backBtn;
}


-(void)setTableView{
    _TableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _TableView.dataSource = self;
    _TableView.delegate = self;
    _TableView.showsVerticalScrollIndicator = YES;
   
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
        
        
    }else{
        cell.textLabel.text = _slistArr[indexPath.row];
       
    }
    return cell;
}

//导航按钮点击方法
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
