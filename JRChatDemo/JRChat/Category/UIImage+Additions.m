//
//  UIImage+Additions.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/13.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

+ (UIImage *)resizableImageWithName:(NSString *)imageName
{
    // 加载原有图片
    UIImage *norImage = [UIImage imageNamed:imageName];
    // 获取原有图片的宽高的一半
    CGFloat w = norImage.size.width * 0.5;
    CGFloat top = norImage.size.height * 0.5;
    CGFloat bottom = norImage.size.height-top;
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [norImage resizableImageWithCapInsets:UIEdgeInsetsMake(top, w, bottom, w) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}


@end
