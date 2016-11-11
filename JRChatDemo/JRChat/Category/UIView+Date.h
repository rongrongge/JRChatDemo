//
//  UIView+time.h
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/19.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Date)

/**
 * 获取聊天信息的时间字符串的前半部分
 *
 * @param timeStr 时间字符串，如：2016－10-01 09:20:30
 * @param dayInterval //消息的发布时间到今天的间隔天数（注：这里不计算时/分/秒产生的间隔差）
 *
 * @return 聊天信息的时间字符串的前半部分
           如：2016－10-01，昨天，星期一等
 */
- (NSString *)getDateStrWithTimeStr:(NSString *)timeStr dayInterval:(int)dayInterval;

/**
 * 获取最终显示在屏幕上的时间字符串
 *
 * @param dateStr 时间字符串的前半部分，如：2016－10-01，昨天，星期一等
 * @param hourStr 小时
 * @param minuteStr 分钟
 *
 * @return 最终显示在屏幕上的时间字符串
 */
- (NSString *)getTimeStrWithDateStr:(NSString *)dateStr hourStr:(NSString *)hourStr minuteStr:(NSString *)minuteStr;

/**
 * 获取某年某月的天数
 *
 * @param yearStr 年
 * @param monthStr 月
 *
 * @return 天数
 */
-(int)getDaysWithYear:(NSString *)yearStr andMonth:(NSString *)monthStr;

@end
