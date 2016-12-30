//
//  findPassWordViewController.m
//  点吧
//
//  Created by Jenny on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "findPassWordViewController.h"
#import "GVColor.h"
@interface findPassWordViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UIImageView *imagePhone;

@property (nonatomic, strong) UIImageView *imageCancel;


@property (nonatomic, strong) UIView *line;//输入框下第一条线

@property (nonatomic, strong) UIView *lineTwo;//输入框下第二条线

@property (nonatomic, strong) UITextField *userName; //输入手机号输入框

@property (nonatomic, strong) UITextField *password;//验证码输入框

@property (nonatomic ,strong) UIButton *textBtn;//获取验证码按钮

@property (nonatomic ,strong) UIButton *loginBtn;
@end

@implementation findPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     [self setNav];
    [self setUpUI];
}
-(void)setUpUI{
    //输入框前面的图标
    _imagePhone = [[UIImageView alloc] initWithFrame:CGRectMake(18, 64 + 45,15,22)];
    _imagePhone.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_imagePhone];
    
    _imageCancel = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imagePhone.bottom + 60 ,22,22)];
    _imageCancel.image = [UIImage imageNamed:@"cancel"];
    [self.view addSubview:_imageCancel];
    
    
    
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(50, 64 + 40, ScreenWidth - 80, 40)];
    _userName.delegate = self;
    _userName.keyboardType = UITextBorderStyleLine;
    
    _userName.placeholder = @"请输入号码";
    _userName.textColor = [GVColor hexStringToColor:@"#bbbbbb"]; 
    //    [_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _userName.keyboardType = UIKeyboardTypeDefault;
    _userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userName.returnKeyType =UIReturnKeyNext;
    _userName.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userName];
    
    _line = [[UIView alloc]initWithFrame:CGRectMake(18, _userName.bottom + 20, ScreenWidth - 26, 0.8)];
    _line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_line];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(50, _userName.bottom + 40, ScreenWidth - 80, 40)];
    _password.delegate = self;
    _password.keyboardType = UITextBorderStyleLine;
    //    _password.backgroundColor = [UIColor clearColor];
    _password.placeholder = @"请输入验证码";
    _password.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _password.secureTextEntry = YES;
    _password.keyboardType = UIKeyboardTypeDefault;
    _password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _password.returnKeyType = UIReturnKeyDone;
    _password.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_password];
    
    _lineTwo = [[UIView alloc]initWithFrame:CGRectMake(18, _password.bottom + 20, ScreenWidth - 26, 0.8)];
    _lineTwo.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineTwo];
    
    
    //获取验证码按钮
    _textBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, _lineTwo.top - 50, 85 , 24)];
    [_textBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_textBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    [_textBtn.layer setCornerRadius:12]; //设置矩圆角半径
    [_textBtn.layer setBorderWidth:0.5];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [_textBtn.layer setBorderColor:colorref];//边框颜色
    _textBtn.layer.borderColor=[GVColor hexStringToColor:@"#ffba14"].CGColor;
    _textBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_textBtn];
    
    
    //登录按钮
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, _lineTwo.bottom + 50, 225 , 33)];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _loginBtn.layer.cornerRadius = 16.5;
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
     [_loginBtn addTarget:self action:@selector(longinclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    
    
}

-(void)longinclick{
    
    if (_userName.text.length<=0 &&_password.text.length<=0)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号和验证码"];
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
        
    }
    
    else if (_userName.text.length<=0 &&_password.text.length>0)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    }
    else if (_userName.text.length>0 &&_password.text.length<=0)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    }
    else
    {
        [SVProgressHUD showWithStatus:@"正在登录..." maskType:SVProgressHUDMaskTypeCustom];
        [self performSelector:@selector(dismissAA) withObject:nil afterDelay:3];
    }
}
-(void)dismissAA{
    
    [SVProgressHUD dismiss];
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
    [self.navigationController popViewControllerAnimated:YES];
    
}


//导航设置
- (void)setNav{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"找回密码";
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
    
    UIBarButtonItem *login = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(loginClick)];
    
    self.navigationItem.rightBarButtonItem=login;
    
}
-(void)loginClick{

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
