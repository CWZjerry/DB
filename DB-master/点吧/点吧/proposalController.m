//
//  proposalController.m
//  点吧
//
//  Created by Jenny on 2017/1/2.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "proposalController.h"
#import "HClTextView.h"
#import <Masonry.h>
@interface proposalController ()
@property (weak, nonatomic) HClTextView *textView;
@property (copy, nonatomic) NSString *myInPutText;

@property (nonatomic ,strong) UIButton *submitBtn;

@end

@implementation proposalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNav];
    HClTextView *textView = [[NSBundle mainBundle] loadNibNamed:@"HClTextView" owner:self options:nil].lastObject;
    [self.view addSubview:textView];
    self.textView = textView;
    
    textView.delegate = self;
    textView.clearButtonType = ClearButtonAppearWhenEditing;
    
      [textView setPlaceholder:nil contentText:_myInPutText maxTextCount:300];
    
    __weak typeof(self) weakSelf = self;
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(@(200));
        make.top.equalTo(weakSelf.view.mas_top).with.offset(0);
    }];
    
    //提交按钮
    _submitBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, 250, 225 , 33)];
    [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [_submitBtn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _submitBtn.layer.cornerRadius = 16.5;
    _submitBtn.layer.masksToBounds = YES;
    _submitBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_submitBtn addTarget:self action:@selector(submitclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_submitBtn];
}
-(void)setNav{
    [self.navigationItem setHidesBackButton:YES];
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"意见反馈";
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
//提交按钮绑定方法
-(void)submitclick:(UIButton *)sender{

}
//导航按钮点击方法
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
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
