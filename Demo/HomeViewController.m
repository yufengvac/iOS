//
//  LoginViewController.m
//  Demo
//
//  Created by feng yu on 16/11/23.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    bg.image = [UIImage imageNamed:@"default_login"];
    [self.view addSubview:bg];
    
    
    NSInteger oneWidth = [[UIScreen mainScreen]bounds].size.width/3;
    NSInteger height = [[UIScreen mainScreen]bounds].size.height;
    NSInteger bottomHeight = 170;
    
    UIButton *weiboBtn = [[UIButton alloc]initWithFrame:CGRectMake((oneWidth-45)/2, height-bottomHeight, 45, 45)];
    [weiboBtn setBackgroundImage:[UIImage imageNamed:@"login_weibo"] forState:UIControlStateNormal];
    [weiboBtn setBackgroundImage:[UIImage imageNamed:@"login_weibo_press"] forState:UIControlStateHighlighted];
    [self.view addSubview:weiboBtn];
    UILabel *weiboLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, height-bottomHeight+45+10, oneWidth, 10)];
    weiboLabel.text = @"微博登录";
    weiboLabel.textColor = [UIColor whiteColor];
    weiboLabel.font = [UIFont systemFontOfSize:13];
    weiboLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:weiboLabel];

    
    UIButton *qqBtn = [[UIButton alloc]initWithFrame:CGRectMake((oneWidth-45)/2+oneWidth, height-bottomHeight, 45, 45)];
    [qqBtn setBackgroundImage:[UIImage imageNamed:@"login_qq"] forState:UIControlStateNormal];
    [qqBtn setBackgroundImage:[UIImage imageNamed:@"login_qq_press"] forState:UIControlStateHighlighted];
    [self.view addSubview:qqBtn];
    UILabel *qqoLabel = [[UILabel alloc]initWithFrame:CGRectMake(oneWidth, height-bottomHeight+45+10, oneWidth, 10)];
    qqoLabel.text = @"QQ登录";
    qqoLabel.textColor = [UIColor whiteColor];
    qqoLabel.font = [UIFont systemFontOfSize:13];
    qqoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:qqoLabel];

    
    UIButton *wxBtn = [[UIButton alloc]initWithFrame:CGRectMake((oneWidth-45)/2+oneWidth*2, height-bottomHeight, 45, 45)];
    [wxBtn setBackgroundImage:[UIImage imageNamed:@"login_wechat"] forState:UIControlStateNormal];
    [wxBtn setBackgroundImage:[UIImage imageNamed:@"login_wechat_press"] forState:UIControlStateHighlighted];
    [self.view addSubview:wxBtn];
    UILabel *wxLabel = [[UILabel alloc]initWithFrame:CGRectMake(oneWidth*2, height-bottomHeight+45+10, oneWidth, 10)];
    wxLabel.text = @"QQ登录";
    wxLabel.textColor = [UIColor whiteColor];
    wxLabel.font = [UIFont systemFontOfSize:13];
    wxLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:wxLabel];
    
    NSInteger halfWidth = [[UIScreen mainScreen]bounds].size.width/2;
    UIButton *accountLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake((halfWidth-100)/2, height-bottomHeight+45+10+55, 100, 10)];
    [accountLoginBtn setTitle:@"账号登录" forState:UIControlStateNormal];
    accountLoginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [accountLoginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventAllEvents];
    [self.view addSubview:accountLoginBtn];
    
    UIButton *regisiterBtn = [[UIButton alloc]initWithFrame:CGRectMake((halfWidth-100)/2+halfWidth, height-bottomHeight+45+10+55, 100, 10)];
    [regisiterBtn setTitle:@"账号注册" forState:UIControlStateNormal];
    [regisiterBtn addTarget:self action:@selector(register) forControlEvents:UIControlEventAllEvents];
    regisiterBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:regisiterBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)login{
    [self presentViewController:[[LoginViewController alloc]init] animated:YES completion:nil];
}
-(void)register{

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
