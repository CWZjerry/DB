//
//  GPSViewController.m
//  Login
//
//  Created by 曹小泽的mac on 2016/12/20.
//  Copyright © 2016年 曹小泽的Mac. All rights reserved.
//

#import "GPSViewController.h"

@interface GPSViewController ()

@end

@implementation GPSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if(self = [super initWithRootViewController:rootViewController])
    {
        self.navigationBar.barTintColor=[UIColor colorWithRed:245/255.0 green:147/255.0 blue:39/255.0 alpha:1.0];
        self.navigationBar.tintColor=[UIColor blackColor];
        //设置标题颜色和字体大小
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:22]}];
    }
    return self;
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
