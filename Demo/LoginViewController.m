//
//  LoginViewController.m
//  Demo
//
//  Created by feng yu on 16/11/23.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "LoginViewController.h"
#import "UIColor+ColorChange.h"
#import "MBProgressHUD+NJ.h"
#import "TabbarHelper.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSInteger screenWidth = [[UIScreen mainScreen]bounds].size.width;
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 220)];
    bg.image = [UIImage imageNamed:@"login_register_bg"];
    [self.view addSubview:bg];
    
    UIImageView *shadomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 50)];
    shadomImageView.image = [UIImage imageNamed:@"shadom_text_bg"];
    [self.view addSubview:shadomImageView];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    [backBtn setTitle:@"取消" forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    backBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventAllEvents];
    [self.view addSubview:backBtn];
    
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth-70, 0, 70, 70)];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [registerBtn addTarget:self action:@selector(register) forControlEvents:UIControlEventAllEvents];
    [self.view addSubview:registerBtn];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((screenWidth-70)/2, 0, 70, 70)];
    titleLabel.text = @"账号登录";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    NSInteger baseHeight = 300;
    NSInteger baseLeftMargin = 25;
    UILabel *accountTitle = [[UILabel alloc]initWithFrame:CGRectMake(baseLeftMargin, baseHeight, 40, 20)];
    accountTitle.text = @"账号";
    accountTitle.textColor = [UIColor lightGrayColor];
    accountTitle.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:accountTitle];
    
    UITextField *accountTextField = [[UITextField alloc]initWithFrame:CGRectMake(baseLeftMargin+40, baseHeight, screenWidth-baseLeftMargin*2-40, 20)];
    accountTextField.placeholder = @"请输入手机号码/邮箱";
    accountTextField.tag = 100;
    accountTextField.delegate =self;
    [accountTextField addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    accountTextField.borderStyle = UITextBorderStyleNone;
    accountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    accountTextField.font = [UIFont systemFontOfSize:13];
    accountTextField.textColor = [UIColor lightGrayColor];
    accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    accountTextField.keyboardType =UIKeyboardTypeNamePhonePad;
    accountTextField.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:accountTextField];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(baseLeftMargin, baseHeight+35, screenWidth-baseLeftMargin*2, 0.3)];
    line.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line];
    
    NSInteger secondBaseHeight =baseHeight+35+15;
    UILabel *passwordTitle = [[UILabel alloc]initWithFrame:CGRectMake(baseLeftMargin, secondBaseHeight, 40, 20)];
    passwordTitle.text = @"密码";
    passwordTitle.textColor = [UIColor lightGrayColor];
    passwordTitle.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:passwordTitle];
    
    UITextField *passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(baseLeftMargin+40, secondBaseHeight, screenWidth-baseLeftMargin*2-40, 20)];
    passwordTextField.placeholder = @"请输入密码";
    passwordTextField.tag = 101;
    passwordTextField.delegate = self;
    [passwordTextField addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    passwordTextField.borderStyle = UITextBorderStyleNone;
    passwordTextField.font = [UIFont systemFontOfSize:13];
    passwordTextField.textColor = [UIColor lightGrayColor];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.keyboardType = UIKeyboardTypeDefault;
    passwordTextField.returnKeyType = UIReturnKeyGo;
    passwordTextField.rightView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"register_editview_invisible"]];
    passwordTextField.rightViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:passwordTextField];
    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(baseLeftMargin, secondBaseHeight+35, screenWidth-baseLeftMargin*2, 0.3)];
    line1.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#DBDADB"];
    [self.view addSubview:line1];
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, secondBaseHeight+35+30, screenWidth-100, 40)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [loginBtn setBackgroundImage:[[UIImage imageNamed:@"button_green"]stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:loginBtn];
    
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    CGFloat rects = self.view.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 +50);
//    NSLog(@"aa%f",rects);
//    if (rects <= 0) {
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect frame = self.view.frame;
//            frame.origin.y = rects;
//            self.view.frame = frame;
//        }];
//    }
//    return YES;
//}


-(void)login{
    UITextField *account = (UITextField *)[self.view viewWithTag:100];
    UITextField *password = (UITextField *)[self.view viewWithTag:101];
    if ([account.text length]==0) {
        [MBProgressHUD showError:@"请输入手机号或邮箱"];
        return;
    }else if([password.text length]==0){
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    [MBProgressHUD showMessage:@"正在登陆，请稍候..."];
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://client.blackbirdsport.com/bk_login?ton=%@&timeStamp=%@&userId=%@&password=%@",token,timeString,account.text,password.text];
    NSLog(@"urlStr=%@",urlStr);
    NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfiguration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSURLSessionTask *sessionTask = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"数据是=%@",result);
        dispatch_async(dispatch_get_main_queue(), ^{
             [MBProgressHUD hideHUD];
            [self parseJson:data];
        });
    }];
    [sessionTask resume];
}

-(void)register{

}

NSInteger prewTag ;  //编辑上一个UITextField的TAG,需要在XIB文件中定义或者程序中添加，不能让两个控件的TAG相同
float prewMoveY; //编辑的时候移动的高度

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    CGFloat keyboardHeight = 216;
    CGRect textFrame =  textField.frame;
    float textY = textFrame.origin.y+textFrame.size.height;
    float bottomY = self.view.frame.size.height-textY;
    NSLog(@"bottomY=%f",bottomY);
    if(bottomY>=keyboardHeight+50)  //判断当前的高度是否已经有216，如果超过了就不需要再移动主界面的View高度
    {
        prewTag = -1;
        return;
    }
    prewTag = textField.tag;
    float moveY = keyboardHeight+50-bottomY;
    prewMoveY = moveY;
    
    NSTimeInterval animationDuration = 0.50f;
    CGRect frame = self.view.frame;
    frame.origin.y -=moveY;//view的Y轴上移
    frame.size.height +=moveY; //View的高度增加
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 101) {
        [textField resignFirstResponder];
    }
    if(prewTag == -1) //当编辑的View不是需要移动的View
    {
        return;
    }
    float moveY ;
    NSTimeInterval animationDuration = 0.50f;
    CGRect frame = self.view.frame;
    if(prewTag == textField.tag) //当结束编辑的View的TAG是上次的就移动
    {   //还原界面
        moveY =  prewMoveY;
        frame.origin.y +=moveY;
        frame.size. height -=moveY;
        self.view.frame = frame;
    }
    //self.view移回原位置
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    [textField resignFirstResponder];

}
-(IBAction)nextOnKeyboard:(UITextField *)textField{
    if (textField.tag == 100) {
        UITextField *passwordTextField = [self.view viewWithTag:101];
        [passwordTextField becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
}

-(void)parseJson:(NSData *)data{
    NSDictionary *directory = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSString *stauts = [directory objectForKey:@"status"];
    if ([stauts isEqualToString:@"ok"]) {
        NSLog(@"登录成功！！！！");
        TabbarHelper *tabbarHelper = [[TabbarHelper alloc]init];
        NSDictionary *userDirt = [directory objectForKey:@"user"];
        tabbarHelper.accountId = [userDirt objectForKey:@"accountId"];
        [self presentViewController:[tabbarHelper getTabbarViewController] animated:NO completion:nil];
    }else {
        [MBProgressHUD showError:@"账号或密码错误！"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
