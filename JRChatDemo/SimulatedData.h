//
//  SimulatedData.h
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/20.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRChatModel.h"

@interface SimulatedData : NSObject

//会话类型  单聊：ConversationTypeChat  群聊：ConversationTypeGroupChat
@property (nonatomic, assign) ConversationType conversationType;

- (NSArray *)getDataModelArr;

@end
