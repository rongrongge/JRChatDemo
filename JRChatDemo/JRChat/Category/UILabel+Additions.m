//
//  UILabel+Additions.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/13.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (CGFloat)jr_attributedTextHeight {
    CGRect rect = [self.attributedText boundingRectWithSize:CGSizeMake(self.width, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size.height;
}

- (CGFloat)jr_getTextHeight {
    CGFloat height = 0;
    if (self.text) {
        NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        self.font, NSFontAttributeName, nil];
        CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.width, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDict context:nil];
        height = rect.size.height;
    } else {
        height = [self jr_attributedTextHeight];
    }
    return (height > kIconWH) ? height : kIconWH;
}

- (CGFloat)jr_getTextWidth
{
    CGFloat width = 0;
    if (self.text) {
        NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        self.font, NSFontAttributeName, nil];
        CGRect rect = [self.text boundingRectWithSize:CGSizeMake(FLT_MAX, kIconWH) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDict context:nil];
        width = rect.size.width;
    }
    return (width > (ScreenWidth - 95 - kEdgeInsetsTextWidth * 2)) ? (ScreenWidth - 95 - kEdgeInsetsTextWidth * 2) : width;
}

@end
