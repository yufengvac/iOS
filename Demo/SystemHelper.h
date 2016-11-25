//
//  SystemHelper.h
//  vnews
//
//  Created by feng yu on 16/11/25.
//  Copyright © 2016年 vac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemHelper : NSObject
+(NSString *)getChannelId;
+(NSString *)getVersion;
+(NSString *)getClientType;
+(NSString *)getDeviceId;
+(NSString *)getUUID;
+(NSString *)getSystemName;
+(NSString *)getSystemVersion;
+(NSString *)getTimeStamp;
@end
