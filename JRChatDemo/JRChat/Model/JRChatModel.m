//
//  JRChatModel.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/12.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "JRChatModel.h"

@implementation JRChatModel

- (CGFloat)getCellHeight
{
    if (self.messageBodyType == MessageBodyTypePhoto) {
        self.isHideTime = [NSDate timeIntervalWithFormer:self.lastMessageTime latter:self.messageTime];
        //timeH是时间的高度
        NSInteger timeH = self.isHideTime ? 0 : 45;
        //nameH是群聊时需要加的高度
        NSInteger nameH = (self.conversationType == ConversationTypeChat) ? 0 : 20;
        self.cellHeight = [self getPhotoHeightWithPhoto:self.imageModel.imageContent] + timeH + nameH;
        return self.cellHeight;
    }else{
        self.isHideTime = [NSDate timeIntervalWithFormer:self.lastMessageTime latter:self.messageTime];
        //timeH是显示时间的高度
        NSInteger timeH = self.isHideTime ? 0 : 45;
        //nameH是群聊时需要加的高度
        NSInteger nameH = (self.conversationType == ConversationTypeChat) ? 0 : 20;
        self.cellHeight = [self getTextHeightWithText:self.textModel.textContent] + 4 + timeH + nameH;
        return self.cellHeight;
    }
}

//获取文本的高度
- (CGFloat)getTextHeightWithText:(NSString *)text
{
    CGFloat height = 0;
    if (text) {
        NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:16], NSFontAttributeName, nil];
        CGRect rect = [text boundingRectWithSize:CGSizeMake(ScreenWidth - 95 - kEdgeInsetsTextWidth * 2, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDict context:nil];
        height = rect.size.height;
    }
    return (height > kIconWH) ? (height+ kEdgeInsetsTextHeight * 2) : (kIconWH + 16);
}


//获取图片的高度
- (CGFloat)getPhotoHeightWithPhoto:(NSString *)photoStr
{
    CGFloat photoHeight;
    UIImage *photo = [UIImage imageNamed:photoStr];
    if (photo) {
        if (photo.size.width>photo.size.height) {
            photoHeight = photo.size.height *(kImageMaxWidth/photo.size.width);
        }else{
            photoHeight = kImageMaxHeight;
        }
    }else{
        photoHeight = 0.01;
    }
    return photoHeight;
}


@end

@implementation JRChatTextModel

@end

@implementation JRChatImageModel

@end
