//
//  DiscoveryViewController.m
//  Demo
//
//  Created by feng yu on 16/11/18.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "EventViewController.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define RIGHT_BTN_SIZE 50
#define STATUS_HEIGHT 10

@interface EventViewController ()

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"活动";
    
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
