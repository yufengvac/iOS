//
//  LevelUtil.h
//  vnews
//
//  Created by feng yu on 16/11/25.
//  Copyright © 2016年 vac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface LevelUtil : NSObject
+(NSString *)getLevelName:(NSInteger)level;
+(UIImage *)getLevelImage:(NSInteger)level;
@end
