//
//  ChatPhotoView.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/17.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "JRChatImageView.h"

@interface JRChatImageView ()
{
    UIImageView *_photo;//图片内容
}

@end

@implementation JRChatImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
         //图片
        _photo = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.bgButton addSubview:_photo];
        _photo.contentMode = UIViewContentModeScaleAspectFill;
        _photo.layer.cornerRadius = 10;
        _photo.clipsToBounds = YES;
    }
    return self;
}

- (void)setChatModel:(JRChatModel *)chatModel
{
    [super setChatModel:chatModel];
    _photo.image = [UIImage imageNamed:chatModel.imageModel.imageContent];
    [self chatPhotoFrameWithModel:chatModel];
}

//图片宽大于高时，设置图片宽为最宽，高度按比例;图片宽小于高时，设置图片高为最高，宽度按比例
- (void)chatPhotoFrameWithModel:(JRChatModel *)chatModel
{
    self.bgButton.top = -5;
    UIImage *photoImage = _photo.image;
    if (photoImage) {
        if (photoImage.size.width>photoImage.size.height) {
            self.bgButton.width = kImageMaxWidth;
            self.bgButton.height = (kImageMaxWidth/photoImage.size.width)*photoImage.size.height;
        }else{
            self.bgButton.height = kImageMaxHeight;
            self.bgButton.width = (kImageMaxHeight/photoImage.size.height)*photoImage.size.width;
        }
    }
    _photo.frame = CGRectMake(kEdgeInsetsImageWidth, kEdgeInsetsImageHeight,  self.bgButton.width - 2*kEdgeInsetsImageWidth, self.bgButton.height - 2*kEdgeInsetsImageHeight);
    if ([chatModel.isMe isEqualToString:@"1"]) {
        self.bgButton.right = ScreenWidth - 55;
    }else{
        self.bgButton.left = 55;
    }
}

@end
