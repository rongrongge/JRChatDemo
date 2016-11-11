//
//  ChatView.h
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/21.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRChatModel.h"

@interface JRChatView : UIView

//正文背景泡泡
@property (nonatomic, strong) UIButton *bgButton;
//数据
@property (nonatomic, strong) JRChatModel *chatModel;

@end
