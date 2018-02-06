//
//  NSDate+Extension.m
//  kuaibang
//
//  Created by mac on 2017/12/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)


//- (NSString *)timeBeforeInfoWithString:(NSTimeInterval)timeIntrval {
//
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//    //获取此时时间戳长度
//    NSTimeInterval nowTimeinterval = [[NSDate date] timeIntervalSince1970];
//    int timeInt = nowTimeinterval - timeIntrval; //时间差
//
//    int year = timeInt / (3600 * 24 * 30 *12);
//    int month = timeInt / (3600 * 24 * 30);
//    int day = timeInt / (3600 * 24);
//    int hour = timeInt / 3600;
//    int minute = timeInt / 60;
//    //    int second = timeInt;
//    if (year > 0) {
//        return [NSString stringWithFormat:@"%d年以前",year];
//    }else if(month > 0){
//        return [NSString stringWithFormat:@"%d个月以前",month];
//    }else if(day > 0){
//        return [NSString stringWithFormat:@"%d天以前",day];
//    }else if(hour > 0){
//        return [NSString stringWithFormat:@"%d小时以前",hour];
//    }else if(minute > 0){
//        return [NSString stringWithFormat:@"%d分钟以前",minute];
//    }else{
//        return [NSString stringWithFormat:@"刚刚"];
//    }
//}
/**
 转化为时间字符串
 
 @param formatter YYYY-MM-dd HH:mm:ss
 @return 时间字符串
 */
- (NSString *)getTimeStringByFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    
    return [dateFormatter stringFromDate:self];
}

- (NSInteger)getAge
{
    NSTimeInterval dateDiff = [self timeIntervalSinceNow];
    long age = fabs(dateDiff/(60*60*24))/365;
    return age;
}

@end
