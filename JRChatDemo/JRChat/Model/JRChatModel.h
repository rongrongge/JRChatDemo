//
//  JRChatModel.h
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/12.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRUserModel.h"

/**
 *  @brief 消息类型
 */
typedef NS_ENUM(NSInteger, MessageBodyType) {
    /**
     *  纯文本消息
     */
    MessageBodyTypeText = 0,
    /**
     *  图片消息
     */
    MessageBodyTypePhoto = 1,
    /**
     *  视频消息
     */
    MessageBodyTypeVideo = 2,
    /**
     *  音频消息
     */
    MessageBodyTypeVoice = 3,
    /**
     *  位置消息
     */
    MessageBodyTypeLocation = 4,
};

typedef NS_ENUM(NSInteger, ConversationType) {
    /*
     *  单聊会话
     */
    ConversationTypeChat,
    /*
     *  群聊会话
     */
    ConversationTypeGroupChat
};


@class JRChatTextModel,JRChatImageModel;
@interface JRChatModel : NSObject

//消息发送的时间
@property (nonatomic, copy) NSString *messageTime;

//判断是否是当前手机用户  1: 是 0: 否
@property (nonatomic, copy) NSString *isMe;

//用户信息
@property (nonatomic, strong) JRUserModel *userModel;

//文本消息
@property (nonatomic, strong) JRChatTextModel *textModel;

//图片消息
@property (nonatomic, strong) JRChatImageModel *imageModel;

//消息类型
@property (nonatomic, assign) MessageBodyType messageBodyType;

//会话类型
@property (nonatomic, assign) ConversationType conversationType;

//判断是否显示时间 YES:显示时间  NO:隐藏时间
@property (nonatomic, assign) BOOL isHideTime;

//记录上一条信息的时间
@property (nonatomic, copy) NSString *lastMessageTime;

//cell的高度
@property (nonatomic, assign) CGFloat cellHeight;

//获取cell的高度
- (CGFloat)getCellHeight;

@end


@interface JRChatTextModel : JRChatModel

//文本消息
@property (nonatomic, copy) NSString *textContent;

@end

@interface JRChatImageModel : JRChatModel

//图片消息
@property (nonatomic, copy) NSString *imageContent;

@end



