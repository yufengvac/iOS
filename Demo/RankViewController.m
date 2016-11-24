//
//  RankViewController.m
//  Demo
//
//  Created by feng yu on 16/11/21.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "RankViewController.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define TOP_BTN_WIDTH 53
#define TOP_BTN_HEIGHT 45

@interface RankViewController ()

@end

@implementation RankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"排行榜";

    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-TOP_BTN_WIDTH, 0, TOP_BTN_WIDTH, TOP_BTN_HEIGHT)];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:rightBtn];
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
