//
//  TabbarHelper.m
//  Demo
//
//  Created by feng yu on 16/11/23.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "TabbarHelper.h"
#import "RidingViewController.h"
#import "EventViewController.h"
#import "RankViewController.h"
#import "TeamViewController.h"
#import "SettingViewController.h"
#import "UIColor+ColorChange.h"

@implementation TabbarHelper
-(UITabBarController *)getTabbarViewController{
    [self generateTabbar];
    return self.tabbar;
}
-(void)generateTabbar{
    UINavigationController *naviga1 = [[UINavigationController alloc]initWithRootViewController:[[RidingViewController alloc]initWithAccountId:self.accountId]];
    
    UINavigationController *naviga2 = [[UINavigationController alloc]initWithRootViewController:[[RankViewController alloc]init]];
    
    UINavigationController *naviga3 = [[UINavigationController alloc]initWithRootViewController:
                                       [[EventViewController alloc]init]];
    
    UINavigationController *naviga4 = [[UINavigationController alloc]initWithRootViewController:[[TeamViewController alloc]init]];
    
    UINavigationController *naviga5 = [[UINavigationController alloc]initWithRootViewController:[[SettingViewController alloc]init]];
    
    self.tabbar = [[UITabBarController alloc]init];
    
    [self.tabbar addChildViewController:naviga1];
    [self.tabbar addChildViewController:naviga2];
    [self.tabbar addChildViewController:naviga3];
    [self.tabbar addChildViewController:naviga4];
    [self.tabbar addChildViewController:naviga5];
    
    UIImage *navigaImage1 = [UIImage imageNamed:@"bottom_bicycling.png"];
    UIImage *navigaImage1_selected = [UIImage imageNamed:@"bottom_bicycling_press.png"];
    navigaImage1 = [navigaImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigaImage1_selected = [navigaImage1_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    naviga1.tabBarItem.image = navigaImage1;
    naviga1.tabBarItem.selectedImage = navigaImage1_selected;
    naviga1.title = @"首页";
    
    
    UIImage *navigaImage2 = [UIImage imageNamed:@"bottom_toplist.png"];
    UIImage *navigaImage2_selected = [UIImage imageNamed:@"bottom_toplist_press.png"];
    navigaImage2 = [navigaImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigaImage2_selected = [navigaImage2_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviga2.tabBarItem.image = navigaImage2;
    naviga2.tabBarItem.selectedImage = navigaImage2_selected;
    naviga2.title = @"排行榜";
    
    UIImage *navigaImage3 = [UIImage imageNamed:@"bottom_team.png"];
    UIImage *navigaImage3_selected = [UIImage imageNamed:@"bottom_team_press.png"];
    navigaImage3 = [navigaImage3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigaImage3_selected = [navigaImage3_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviga3.tabBarItem.image = navigaImage3;
    naviga3.tabBarItem.selectedImage = navigaImage3_selected;
    naviga3.title = @"车队";
    
    
    UIImage *navigaImage4 = [UIImage imageNamed:@"bottom_event.png"];
    UIImage *navigaImage4_selected = [UIImage imageNamed:@"bottom_event_press.png"];
    navigaImage4 = [navigaImage4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigaImage4_selected = [navigaImage4_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviga4.tabBarItem.image = navigaImage4;
    naviga4.tabBarItem.selectedImage = navigaImage4_selected;
    naviga4.title = @"活动";
    
    UIImage *navigaImage5 = [UIImage imageNamed:@"bottom_more.png"];
    UIImage *navigaImage5_selected = [UIImage imageNamed:@"bottom_more_press.png"];
    navigaImage5 = [navigaImage5 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigaImage5_selected = [navigaImage5_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviga5.tabBarItem.image = navigaImage5;
    naviga5.tabBarItem.selectedImage = navigaImage5_selected;
    naviga5.title = @"更多";
    //    naviga1.tabBarItem.badgeValue = @"1";
    
    
    //    naviga1.navigationBar.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#E5E5E4"];
    [naviga1.navigationBar setHidden:YES];
    
    naviga2.navigationBar.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#E5E5E4"];
    naviga3.navigationBar.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#E5E5E4"];
    naviga4.navigationBar.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#E5E5E4"];
    naviga5.navigationBar.backgroundColor = [UIColor_ColorChange colorWithHexString:@"#E5E5E4"];
    
    
    //    naviga1.navigationBar.tintColor = [UIColor_ColorChange colorWithHexString:@"#19BD9A"];
    naviga2.navigationBar.tintColor = [UIColor_ColorChange colorWithHexString:@"#ff0000"];
    
    
    //    naviga1.navigationBar.barTintColor =[UIColor_ColorChange colorWithHexString:@"#19BD9A"];
    naviga2.navigationBar.barTintColor =[UIColor_ColorChange colorWithHexString:@"#19BD9A"];
    naviga3.navigationBar.barTintColor =[UIColor_ColorChange colorWithHexString:@"#19BD9A"];
    naviga4.navigationBar.barTintColor =[UIColor_ColorChange colorWithHexString:@"#19BD9A"];
    naviga5.navigationBar.barTintColor =[UIColor_ColorChange colorWithHexString:@"#19BD9A"];
    
    
    //    [naviga1.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [naviga2.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [naviga3.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [naviga4.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [naviga5 .navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor_ColorChange colorWithHexString:@"#19BD9A"], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
}
@end
