//
//  NSDate+Addition.h
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/19.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)

/**
 * 根据时间字符串获取时间
 *
 * @param dateString 时间字符串，如：2016－10-01 09:20:30
 * @param formate 时间的显示格式
 *
 * @return 时间
 */
+ (NSDate *)dateString:(NSString *)dateString WithFormate:(NSString *)formate;

/**
 * 根据2个时间之间的时间戳判断界面是否显示时间
 *
 * @param formerTime 起始时间
 * @param latterTime 终止时间
 *
 * @return 返回判断界面是否显示时间的布尔值
           YES:隐藏时间  NO:显示时间
 */
+ (BOOL)timeIntervalWithFormer:(NSString *)formerTime latter:(NSString *)latterTime;

/**
 * 获取dateComponents对象
 *
 * @param fromDate 起始时间
 * @param toDate 终止时间
 *
 * @return dateComponents对象
 */
+ (NSDateComponents *)getCalendarFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

@end
