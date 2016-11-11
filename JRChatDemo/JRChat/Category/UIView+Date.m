//
//  UIView+time.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/19.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "UIView+Date.h"

@implementation UIView (Date)

//获取聊天信息的时间字符串的前半部分
- (NSString *)getDateStrWithTimeStr:(NSString *)timeStr dayInterval:(int)dayInterval
{
    NSString *dateStr = [NSString string];
    if (dayInterval >= 7) {
        dateStr = [timeStr substringWithRange:NSMakeRange(5, 5)];
    }else if (dayInterval > 1){
        dateStr = [self getWeekdayWithTimeStr:timeStr];
    }else if (dayInterval == 1){
        dateStr = @"昨天";
    }else{
        dateStr = @"";
    }
    return dateStr;
}

//获取最终显示在屏幕上的时间
- (NSString *)getTimeStrWithDateStr:(NSString *)dateStr hourStr:(NSString *)hourStr minuteStr:(NSString *)minuteStr
{
    int rHour = [hourStr intValue];
    if (rHour>12) {
        return [NSString stringWithFormat:@"%@ 下午%d:%@",dateStr,(rHour - 12),minuteStr];
    }else{
        return [NSString stringWithFormat:@"%@ 上午%d:%@",dateStr,rHour,minuteStr];
    }
}

//获取某年某月的天数
-(int)getDaysWithYear:(NSString *)yearStr andMonth:(NSString *)monthStr
{
    int year = [yearStr intValue];
    int month = [monthStr intValue];
    int day=0;
    switch(month)
    {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:day=31;
            break;
        case 4:case 6:case 9:case 11:day=30;
            break;
        case 2:{
            if(((year%4==0)&&(year%100!=0))||(year%400==0)){
                day=29;
                break;
            }
            else{
                day=28;
                break;
            }
        }
        default:
            break;
    }
    return day;
}

/**
 * 根据日期获取星期几
 *
 * @param timeStr 时间字符串，如：2016－10-01 09:20:30
 *
 * @return 星期
 */
- (NSString *)getWeekdayWithTimeStr:(NSString *)timeStr
{    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [df dateFromString:timeStr];
    
    //获取日期
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned int unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    long week = [comps weekday] - 1;
    return [arrWeek objectAtIndex:week];
}

@end
