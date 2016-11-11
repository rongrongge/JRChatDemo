//
//  ChatView.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/21.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "JRChatView.h"

@implementation JRChatView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //背景泡泡
        _bgButton = [[UIButton alloc]initWithFrame:CGRectZero];
        [self addSubview:_bgButton];
//        _bgButton.backgroundColor = [UIColor redColor];
    }
    return  self;
}

- (void)setChatModel:(JRChatModel *)chatModel
{
    if ([chatModel.isMe isEqualToString:@"1"]) {
        [_bgButton setBackgroundImage:[UIImage resizableImageWithName:@"chat_send_nor"] forState:UIControlStateNormal];
        [_bgButton setBackgroundImage:[UIImage resizableImageWithName:@"chat_send_nor_pic"] forState:UIControlStateSelected];
     }else{
        [_bgButton setBackgroundImage:[UIImage resizableImageWithName:@"chat_recive_nor"] forState:UIControlStateNormal];
        [_bgButton setBackgroundImage:[UIImage resizableImageWithName:@"chat_recive_press_pic"] forState:UIControlStateSelected];
    }
}


@end
