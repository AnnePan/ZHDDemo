//
//  ZHLoginVc.m
//  ZHD
//
//  Created by Anne Pan on 14-6-24.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "ZHLoginVc.h"
#import "ZHDRootViewController.h"

@interface ZHLoginVc ()
{
    UITextField *_uNameTF;
    UITextField *_uPassTF;
}

@end

@implementation ZHLoginVc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    UIImageView *loginBg = [[UIImageView alloc] initWithFrame:self.view.frame];
    loginBg.image =[UIImage imageNamed:@"zh_login_bg"];
    [self.view addSubview:loginBg];
    
    UIView *loginV = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height/2, self.view.width, self.view.height/2)];
    loginV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:loginV];
    
    UIView *bottomV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
    bottomV.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bottomV];
    
    bottomV.bottom = self.view.bottom;
    loginV.bottom = bottomV.top;
    
    //用户名
    _uNameTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 15, self.view.width - 30, 50)];
    _uNameTF.backgroundColor = [UIColor whiteColor];
    UIImageView *nInce = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _uNameTF.height, _uNameTF.height)];
    nInce.backgroundColor = [UIColor lightGrayColor];
    nInce.image = [UIImage imageNamed:@"chat_vcard"];
    _uNameTF.leftView = nInce;
    _uNameTF.leftViewMode = UITextFieldViewModeAlways;
    _uNameTF.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    _uNameTF.placeholder = @"用户名/电子邮箱/电话";
    _uNameTF.borderStyle = UITextBorderStyleLine;
    _uNameTF.borderColor = [UIColor lightGrayColor];
    [loginV addSubview:_uNameTF];
    
    //密码
    _uPassTF = [[UITextField alloc] initWithFrame:CGRectMake(15, _uNameTF.bottom + 40, self.view.width - 30, 50)];
    _uPassTF.backgroundColor = [UIColor whiteColor];
    UIImageView *pInce = [[UIImageView alloc] initWithFrame:CGRectMake(4, 4, _uPassTF.height-8, _uPassTF.height-8)];
    pInce.backgroundColor = [UIColor lightGrayColor];
    pInce.image = [UIImage imageNamed:@"group_private_icon"];
    _uPassTF.leftView = pInce;
    _uPassTF.leftViewMode = UITextFieldViewModeAlways;
    _uPassTF.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    _uPassTF.placeholder = @"密码";
    _uPassTF.borderStyle = UITextBorderStyleLine;
    _uPassTF.borderColor = [UIColor lightGrayColor];
    [loginV addSubview:_uPassTF];
    
    //登录按钮
    UIView *uLoginV = [[UIView alloc] initWithFrame:CGRectMake(0, _uPassTF.bottom + 40, self.view.width, 90)];
    uLoginV.backgroundColor = [UIColor whiteColor];
    UIButton *loginBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 15, 120, 40)];
    loginBT.backgroundColor = [UIColor greenColor];
    [loginBT setTitle:@"登录" forState:UIControlStateNormal];
    loginBT.titleLabel.textColor = [UIColor whiteColor];
    [loginBT addTarget:self action:@selector(startLogin:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *fondPWLab = [[UILabel alloc] initWithFrame:CGRectMake(0, loginBT.bottom + 10, uLoginV.width, 20)];
    fondPWLab.font = [UIFont systemFontOfSize:14];
    fondPWLab.text = @"忘记用户名或密码";
    fondPWLab.textColor = [UIColor grayColor];
    [fondPWLab sizeToFit];
    [uLoginV addSubview:loginBT];
    [uLoginV addSubview:fondPWLab];
    loginBT.centerX = fondPWLab.centerX = uLoginV.centerX;
    [loginV addSubview:uLoginV];
    
    UIView *servicePhoneV = [[UIView alloc] initWithFrame:bottomV.bounds];
    [bottomV addSubview:servicePhoneV];
    
    UIImageView *phoneImgV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zh_login_phone"]];
    [servicePhoneV addSubview:phoneImgV];
    
    UILabel *phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    phoneLab.text = @"服务热线";
    phoneLab.font = [UIFont systemFontOfSize:20];
    phoneLab.textColor = [UIColor whiteColor];
    [phoneLab sizeToFit];
    [servicePhoneV addSubview:phoneLab];
    phoneLab.left = phoneImgV.right;
    
    servicePhoneV.width = phoneImgV.width + phoneLab.width;
    servicePhoneV.height = phoneImgV.height > phoneLab.height ? phoneImgV.height : phoneLab.height;
    servicePhoneV.centerX = bottomV.bounds.size.width/2;
    servicePhoneV.centerY = bottomV.bounds.size.height/2;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    _uNameTF.text = @"test@163.com";
    _uPassTF.text = @"123456";
}

- (void)startLogin:(UIButton *)btn
{
    NSString *uName = _uNameTF.text;
    NSString *uPass = _uPassTF.text;
    
    if (![uName isEqualToString:@"test@163.com"]) {
        return;
    }
    if (![uPass isEqualToString:@"123456"]) {
        return;
    }
    
    ZHDRootViewController *rootVC = [[ZHDRootViewController alloc]init];
    [self presentViewController:rootVC animated:YES completion:nil];
    NSLog(@"tiaozhuang");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_uPassTF resignFirstResponder];
    [_uNameTF resignFirstResponder];
}

@end
