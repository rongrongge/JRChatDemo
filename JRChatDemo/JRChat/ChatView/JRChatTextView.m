//
//  ChatTextView.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/17.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "JRChatTextView.h"

@interface JRChatTextView ()
{
    UILabel *_contentLabel;//文本内容
}
@end

@implementation JRChatTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //正文
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:16];
        [self.bgButton addSubview:_contentLabel];
    }
    return  self;
}

- (void)setChatModel:(JRChatModel *)chatModel
{
    [super setChatModel:chatModel];
    _contentLabel.text = chatModel.textModel.textContent;
    [self chatTextFrameWithModel:chatModel];
}

/** 设置正文的frame */
- (void)chatTextFrameWithModel:(JRChatModel *)chatModel
{
    self.bgButton.top = -5;
    _contentLabel.left = kEdgeInsetsTextWidth;
    _contentLabel.width = [_contentLabel jr_getTextWidth];
    self.bgButton.width = _contentLabel.width + kEdgeInsetsTextWidth * 2;
    _contentLabel.height = [_contentLabel jr_getTextHeight];
    _contentLabel.top = (_contentLabel.height==kIconWH) ? 8 : kEdgeInsetsTextHeight;
    self.bgButton.height = (_contentLabel.height==kIconWH) ? (kIconWH + 16) : (_contentLabel.height + kEdgeInsetsTextHeight * 2);
    
    if ([chatModel.isMe isEqualToString:@"1"]) {
        self.bgButton.right = ScreenWidth - 55;
    }else{
        self.bgButton.left = 55;
    }
}

@end
