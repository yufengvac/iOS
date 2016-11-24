//
//  RidingViewController.h
//  Demo
//
//  Created by feng yu on 16/11/22.
//  Copyright © 2016年 vac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RidingViewController : UIViewController
@property(nonatomic,strong) NSString* accountId;
-(instancetype)initWithAccountId:(NSString *)accountId;
@end
