//
//  JROthersChatCell.h
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/12.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRChatModel.h"

@interface JRChatCell : UITableViewCell

//判断是否显示时间 YES:显示时间  NO:隐藏时间
//@property (nonatomic, assign) BOOL isHideTime;

//数据
@property (nonatomic, strong) JRChatModel *chatModel;

@end
