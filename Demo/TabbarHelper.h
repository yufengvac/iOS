//
//  TabbarHelper.h
//  Demo
//
//  Created by feng yu on 16/11/23.
//  Copyright © 2016年 vac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TabbarHelper : NSObject
@property(nonatomic,retain) NSString *accountId;
@property UITabBarController *tabbar;
-(UITabBarController *)getTabbarViewController;
@end
