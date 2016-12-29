//
//  LoginViewController.m
//  点吧
//
//  Created by Jenny on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.


#import "LoginViewController.h"
#import "GVColor.h"
#import "UIView+Addition.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    UIView *line;
    UIView *lineTwo;
}
@property (nonatomic, strong) UIView *shadowView;

@property (nonatomic, strong) UIButton *titleBtn;

@property (nonatomic, strong) UIButton *titlePassBtn;

@property (nonatomic, strong) UITextField *userName;

@property (nonatomic, strong) UITextField *password;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [GVColor hexStringToColor:@"#f2f2f2"];
    
    [self setNav];
    [self setUpUI];
}

-(void)setUpUI{
    //设置底色
    _shadowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 370)];
    _shadowView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_shadowView];
    
    _titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, 79, ScreenWidth/2, 30)];
    [_titleBtn setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
    
    //设置颜色需要状态  后边
    [_titleBtn setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal
     ];
    _titleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_titleBtn];
    
    _titlePassBtn = [[UIButton alloc]initWithFrame:CGRectMake(_titleBtn.top + 54 , 79, ScreenWidth - 120, 30)];
    [_titlePassBtn setTitle:@"账号密码登录" forState:UIControlStateNormal];
    
    //设置颜色需要状态  后边
    [_titlePassBtn setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal];
    _titlePassBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_titlePassBtn];
    //输入框下边线条两条
    UIButton *topLine=[[UIButton alloc]initWithFrame:CGRectMake(_titleBtn.top, _titleBtn.bottom + 10, ScreenWidth/2 - 110, 1)];
    [topLine setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    
    [self.view addSubview:topLine];
    
    //    UIButton *bottomLine=[[UIButton alloc]initWithFrame:CGRectMake(_titlePassBtn.top, _titlePassBtn.bottom + 10, ScreenWidth - 120, 1)];
    //    [bottomLine setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    //    [self.view addSubview:bottomLine];
    
    //输入框前面的图标
    UIImageView *imagePhone = [[UIImageView alloc] initWithFrame:CGRectMake(18, _titleBtn.bottom + 50,15,22)];
    imagePhone.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:imagePhone];
    
    UIImageView *imageCancel = [[UIImageView alloc] initWithFrame:CGRectMake(18, _titleBtn.bottom + 40+90,22,22)];
    imageCancel.image = [UIImage imageNamed:@"cancel"];
    [self.view addSubview:imageCancel];
    
    
    
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(50, _titleBtn.bottom + 40, ScreenWidth - 80, 40)];
    _userName.delegate = self;
    _userName.keyboardType = UITextBorderStyleLine;
    
    _userName.placeholder = @"请输入您的手机号";
    _userName.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    //    [_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _userName.keyboardType = UIKeyboardTypeDefault;
    _userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userName.returnKeyType =UIReturnKeyNext;
    _userName.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userName];
    
    line = [[UIView alloc]initWithFrame:CGRectMake(18, _userName.bottom + 20, ScreenWidth - 26, 0.8)];
    line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:line];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(50, _userName.bottom + 40, ScreenWidth - 80, 40)];
    _password.delegate = self;
    _password.keyboardType = UITextBorderStyleLine;
    //    _password.backgroundColor = [UIColor clearColor];
    _password.placeholder = @"请输入您收到的验证码";
    _password.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _password.secureTextEntry = YES;
    _password.keyboardType = UIKeyboardTypeDefault;
    _password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _password.returnKeyType = UIReturnKeyDone;
    _password.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_password];
    
    lineTwo = [[UIView alloc]initWithFrame:CGRectMake(18, _password.bottom + 20, ScreenWidth - 26, 0.8)];
    lineTwo.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:lineTwo];
    
    UILabel *promptLable = [[UILabel alloc] initWithFrame:CGRectMake(25, _password.bottom+34, ScreenWidth, 40)];
    promptLable.text = @"未注册账号的手机号，登录时将自动注册，且代表您已同意";
    promptLable.font = [UIFont systemFontOfSize:12];
    promptLable.textColor = [UIColor lightGrayColor];
    [self.view addSubview:promptLable];
    
    UIButton *promptBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, promptLable.bottom - 10, 150, 30)];
    [promptBtn setTitle:@"《点注册服务协议》" forState:UIControlStateNormal];
    [promptBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    
    promptBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [self.view addSubview:promptBtn];
    //获取验证码按钮
    UIButton *textBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, line.top - 50, 85 , 24)];
    [textBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [textBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    [textBtn.layer setCornerRadius:12]; //设置矩圆角半径
    [textBtn.layer setBorderWidth:0.5];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [textBtn.layer setBorderColor:colorref];//边框颜色
    textBtn.layer.borderColor=[GVColor hexStringToColor:@"#ffba14"].CGColor;
    
    textBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [self.view addSubview:textBtn];
    
    
    //登录按钮
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, _shadowView.bottom + 50, 225 , 33)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    loginBtn.layer.cornerRadius = 16.5;
    loginBtn.layer.masksToBounds = YES;
    
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [self.view addSubview:loginBtn];
    
    
    
    //    NSArray *arr = [NSArray arrayWithObjects:@"登录",@"马上注册", nil];
    //    for (int i = 0; i < 2; i ++) {
    //        UIButton *btn = [[UIButton alloc]init];
    //        [btn setTitle:arr[i] forState:UIControlStateNormal];
    //        btn.frame = CGRectMake((i+1) * (ScreenWidth/4) + i * (ScreenWidth/4) - 40, _password.bottom + 25, 80, 40);
    //        btn.backgroundColor = [UIColor clearColor];
    //        btn.titleLabel.font = [UIFont systemFontOfSize:18.f];
    //        btn.tag = i;
    //        [self.view addSubview:btn];
    //    }
    
    //    NSArray *loginArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"share_sina_n@2x"],
    //                         [UIImage imageNamed:@"share_weixin@2x"],
    //                         [UIImage imageNamed:@"share_qq@2x"], nil];
    //    for (int i = 0; i < 3; i ++) {
    //        UIButton *loginBtn = [[UIButton alloc]init];
    //        loginBtn.frame = CGRectMake((i + 1) * (ScreenWidth/6) + i * (ScreenWidth/6) - 25, ScreenHeight - 70, 50, 50);
    //        [loginBtn setBackgroundImage:loginArr[i] forState:UIControlStateNormal];
    //        [self.view addSubview:loginBtn];
    //    }
    //
    //    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 85, ScreenWidth, 0.8)];
    //    bottomLine.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:bottomLine];
    //
    //    for (int i = 0; i < 2; i ++) {
    //
    //        UIView *line = [[UIView alloc]initWithFrame:CGRectMake((i+1) * (ScreenWidth/3), bottomLine.bottom + 30, 0.8, 25)];
    //        line.backgroundColor = [UIColor whiteColor];
    //        [self.view addSubview:line];
    //    }
    //
    //    NSString *aStr = @"登录或者注册即同意开眼用户服务协议";
    //    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:aStr];
    //    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.f] range:NSMakeRange(0,11)];
    //    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,11)];
    //    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.f] range:NSMakeRange(11,6)];
    //    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(11,6)];
    //
    //    UIButton *butn = [[UIButton alloc]init];
    //    [butn setBackgroundColor:[UIColor clearColor]];
    //    butn.frame = CGRectMake(ScreenWidth/2 - 120, ScreenHeight - 130, 240, 20);
    //    [butn setAttributedTitle:str forState:UIControlStateNormal];
    //    [butn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:butn];
}
-(void)titleBtnClick{
    
}

//导航设置
- (void)setNav{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"登录";
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [_userName resignFirstResponder];
    [_password resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_userName resignFirstResponder];
    [_password resignFirstResponder];
    return YES;
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
