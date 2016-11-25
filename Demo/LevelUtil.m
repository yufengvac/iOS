//
//  LevelUtil.m
//  vnews
//
//  Created by feng yu on 16/11/25.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "LevelUtil.h"

@implementation LevelUtil
+(NSString *)getLevelName:(NSInteger)level{
    
    NSArray *levelNames  = @[@"菜鸟级",@"铜雀级",@"银雀级",@"金雀级"
                                     ,@"铜燕级",@"银燕级",@"金燕级"
                                     ,@"铜鸿级",@"银鸿级",@"金鸿级"
                                     ,@"铜鹰级",@"银鹰级",@"金鹰级"
                                     ,@"铜鹏级",@"银鹏级",@"金鹏级"];
    return levelNames[level];
}
+(UIImage *)getLevelImage:(NSInteger)level{

    NSArray *levelPics = @[@"level_cainiao",@"level_sparrow_c",@"level_sparrow_s",@"level_sparrow_g"
                                           ,@"level_swallow_c",@"level_swallow_s",@"level_swallow_g"
                                           ,@"level_swan_c",@"level_swan_s",@"level_swan_g"
                                           ,@"level_eagle_c",@"level_eagle_s",@"level_eagle_g"
                                           ,@"level_peng_c",@"level_peng_s",@"level_peng_g"];
    return [UIImage imageNamed:levelPics[level]];
}
@end
