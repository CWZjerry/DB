//
//  MyInfoViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "MyInfoViewController.h"
#import "MyInfoView.h"
@interface MyInfoViewController () <UITableViewDataSource,UITableViewDelegate> {
    
    MyInfoView *myView;
    NSArray *sectionOne;
    NSArray *sectionTwo;
}
@property (nonatomic ,strong) UIButton *leaveBtn;

@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNav];
    myView = [[MyInfoView alloc] initWithFrame:self.view.frame];
    
    self.view = myView;
    
    sectionOne = @[@"头像",
                   @"昵称",
                   @"生日"
                   ];
    
    sectionTwo = @[@"电话",
                   @"密码"
                   ];
    
    myView.myTable.delegate = self;
    myView.myTable.dataSource = self;
    
    
}
//导航设置
- (void)setNav{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"我的消息";
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        default:
            return 1;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = sectionOne[indexPath.row];
            switch (indexPath.row) {
                case 0:
                {
//                    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-100, 10, 80, 80)];
//                    img.image = [UIImage imageWithData:self.user.image];
//                    [cell.contentView addSubview:img];
                    
                }
                    break;
                case 1:
                {
//                    cell.detailTextLabel.text = self.user.name;
                    
                    
                }
                    break;
                case 2:
                {
                    cell.detailTextLabel.text = self.user.phoneNum;
                }
                    break;
                    
                default:
                    break;
            }
            
            break;
        case 1:
            cell.textLabel.text = sectionTwo[indexPath.row];
            
            switch (indexPath.row) {
                case 0:
                    cell.detailTextLabel.text = self.user.phoneNum;
                    break;
                case 1:
                    cell.detailTextLabel.text = self.user.password;
                    break;
                default:
                    break;
            }
            
            break;
            
        case 2:
            cell.accessoryType = 0;

            _leaveBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, 5 , 225 , 60)];
            [_leaveBtn setTitle:@"退出登录" forState:UIControlStateNormal];
            [_leaveBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
            
           
            _leaveBtn.titleLabel.font = [UIFont systemFontOfSize:17];
            [_leaveBtn addTarget:self action:@selector(leaveBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell addSubview:_leaveBtn];
            
            break;
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                
                return 100;
            }else {
                return 60;
            }
            break;
            
        default:
            
            return 60;
            break;
    }
    
}
-(void)leaveBtn:(UIButton *)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注销" message:@"确定要注销登录吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
    

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
//        [[UserInfoManager share] logoutUserInfo];
        
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.0001;
}


@end
