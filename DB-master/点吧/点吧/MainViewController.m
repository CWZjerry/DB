//
//  MainViewController.m
//  点吧
//
//  Created by Pro on 2016/12/26.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "TakeAwayViewController.h"
#import "OrderViewController.h"
#import "MySelfViewController.h"
#import "AFNManager.h"
#import "GPSViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpController];
    //AFN封装测试
    NSString * str = @"https://api.weibo.com/2/statuses/home_timeline.json?access_token=2.00DsiAWGOwnFDBf2cc16b96d0Ojl4W";
    [[AFNManager sharedManager]requestType:GET URL:str withparameters:nil success:^(id data) {
       // NSLog(@"%@",data);
    } failure:^(NSError *error) {
       // NSLog(@"%@",error);
    }];
    
    
}

-(void)setUpController
{
    [self addOneChildViewController:[[GPSViewController alloc]initWithRootViewController:[[HomeViewController alloc]init]]
                          WithTitle:@"首页"
                          imageName:@"home_press"
                  selectedImageName:@"home_up"];
    [self addOneChildViewController:[[GPSViewController alloc]initWithRootViewController:[[TakeAwayViewController alloc]init]]
                          WithTitle:@"外卖"
                          imageName:@"take_down"
                  selectedImageName:@"take_up"];
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[OrderViewController alloc]init]]
                          WithTitle:@"订单"
                          imageName:@"indent_down"
                  selectedImageName:@"indent_up"];
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[MySelfViewController alloc]init]]
                          WithTitle:@"我的"
                          imageName:@"mine_down"
                  selectedImageName:@"mine_up"];
    
    
}


/**
  //添加每个控制器

 @param viewController 控制器
 @param title 标题
 @param imageName 图片
 @param selectedImageName 点击图片
 */
- (void)addOneChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    viewController.tabBarItem.title         = title;
    viewController.tabBarItem.image         = [UIImage imageNamed:imageName];
    UIImage *image = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    [self addChildViewController:viewController];
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
