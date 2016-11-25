//
//  SystemHelper.m
//  vnews
//
//  Created by feng yu on 16/11/25.
//  Copyright © 2016年 vac. All rights reserved.
//

#import "SystemHelper.h"
#import "UIKit/UIKit.h"

@implementation SystemHelper

+(NSString *)getChannelId{
    return @"000";
}
+(NSString *)getVersion{
    return [[[NSBundle mainBundle]infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}
+(NSString *)getClientType{
    return @"IPHONE";
}
+(NSString *)getDeviceId{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[[UIDevice currentDevice]identifierForVendor] UUIDString];
    }else{
        return [SystemHelper getUUID];
    }
}
+(NSString *)getUUID{
    CFUUIDRef puuid =  CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil,puuid);
    NSString *result = (NSString *)CFBridgingRelease(uuidString);
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
+(NSString *)getSystemName{
    return [[UIDevice currentDevice]systemName];
}
+(NSString *)getSystemVersion{
    return [[UIDevice currentDevice]systemVersion];
}
+(NSString *)getTimeStamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSInteger time = (NSInteger)a;
    NSString *timeString = [NSString stringWithFormat:@"%ld",(long)time];
    return timeString;
}
@end
