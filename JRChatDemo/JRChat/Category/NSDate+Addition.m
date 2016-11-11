//
//  NSDate+Addition.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/19.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)

+ (NSDate *)dateString:(NSString *)dateString WithFormate:(NSString *)formate
{
    NSDateFormatter *dataformate= [[NSDateFormatter alloc]init];
    [dataformate setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    dataformate.dateFormat = formate;
    return [dataformate dateFromString:dateString];
}

+ (BOOL)timeIntervalWithFormer:(NSString *)formerTime latter:(NSString *)latterTime
{
    NSDate *former = [NSDate dateString:formerTime WithFormate:KDateFormate];
    NSDate *latter = [NSDate dateString:latterTime WithFormate:KDateFormate];
    
    NSTimeInterval timeInterval = [latter timeIntervalSinceDate:former];
    return (timeInterval > kTimeInterval) ? NO : YES;
}

+ (NSDateComponents *)getCalendarFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSCalendar *calendar = nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f) {
        calendar = [NSCalendar currentCalendar];
    }else{
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
    unsigned int unit =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:fromDate toDate:toDate options:0];
}

@end
