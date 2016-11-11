//
//  JROthersChatCell.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/12.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "JRChatCell.h"
#import "JRChatTextView.h"
#import "JRChatImageView.h"

@interface JRChatCell ()
{
    //消息的发布时间到今天的时间间隔年数（注：这里不计算天/时/分/秒产生的间隔差）
    int yearInterval;//如2015－9-30 10:20:30 与 2016－01-01 09:20:30 的 yearInterval＝2016-2015 =1
    
    //消息的发布时间到今天的时间间隔月数（注：这里不计算天/时/分/秒产生的间隔差）
    int monthInterval;//如2016－9-30 10:20:30 与 2016－10-01 09:20:30 的 monthInterval＝10-9=1
    
    //消息的发布时间到今天的时间间隔天数（注：这里不计算时/分/秒产生的间隔差）
    int dayInterval;//如2016－10-01 23:59:30 与 2016－10-02 00:00:00 的 dayInterval＝2-1=1
    
    //文本消息
    JRChatTextView *chatTextView;
    
    //图片消息
    JRChatImageView *chatImageView;
}
//展示消息内容的容器
@property (nonatomic, strong) UIView *bgView;

//头像
@property (nonatomic, strong) UIImageView *iconImageView;

//消息发送的时间
@property (nonatomic, strong) UILabel *timeLabel;

//用户姓名
@property (nonatomic, strong) UILabel *nameLabel;

//某一条消息发送的时间
@property (nonatomic, strong) NSDate *messageDate;

@end

@implementation JRChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        
        //时间
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_timeLabel];
        
        //头像
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_iconImageView];
        
        //姓名
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_nameLabel];
        
        //消息正文的容器
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_bgView];
    }
    return self;
}

- (void)setChatModel:(JRChatModel *)chatModel
{
    _iconImageView.image = [UIImage imageNamed:chatModel.userModel.userIcon];
    _nameLabel.text = chatModel.userModel.userName;
    [self setTimeLabelWithModel:chatModel];
    [self setContentWithModel:chatModel];
    [self setFrameWithModel:chatModel];
}

//消息的时间
- (void)setTimeLabelWithModel:(JRChatModel *)chatModel
{
    //    //测试数据
    //    NSString *M_todayStr = @"2016-10-01 16:46:13";
    //    NSDate *todayDate = [NSDate dateString:M_todayStr WithFormate:KDateFormate];
    
    NSDate *todayDate = [NSDate date];
    NSString *todayStr = [NSString stringWithFormat:@"%@",todayDate];
    NSString *today_yearStr = [todayStr substringWithRange:NSMakeRange(0, 4)];
    NSString *today_monthStr = [todayStr substringWithRange:NSMakeRange(5, 2)];
    NSString *today_dayStr = [todayStr substringWithRange:NSMakeRange(8, 2)];
    
    if (chatModel.messageTime) {
        _messageDate = [NSDate dateString:chatModel.messageTime WithFormate:KDateFormate];
        
        NSString *dateStr = [chatModel.messageTime substringWithRange:NSMakeRange(0, 10)];
        NSString *yearStr = [chatModel.messageTime substringWithRange:NSMakeRange(0, 4)];
        NSString *monthStr = [chatModel.messageTime substringWithRange:NSMakeRange(5, 2)];
        NSString *dayStr = [chatModel.messageTime substringWithRange:NSMakeRange(8, 2)];
        NSString *hourStr = [chatModel.messageTime substringWithRange:NSMakeRange(11, 2)];
        NSString *minuteStr = [chatModel.messageTime substringWithRange:NSMakeRange(14, 2)];
    
        yearInterval = [today_yearStr intValue] - [yearStr intValue];
        if (yearInterval > 0) {
            dateStr = [chatModel.messageTime substringWithRange:NSMakeRange(0, 10)];
        }else{
            monthInterval = [today_monthStr intValue] - [monthStr intValue];
            if (monthInterval > 0) {
                int days = [self getDaysWithYear:yearStr andMonth:monthStr];
                dayInterval = days + [today_dayStr intValue] - [dayStr intValue];
            }else{
                dayInterval = [today_dayStr intValue] - [dayStr intValue];
            }
            dateStr = [self getDateStrWithTimeStr:chatModel.messageTime dayInterval:dayInterval];
        }
        _timeLabel.text = [self getTimeStrWithDateStr:dateStr hourStr:hourStr minuteStr:minuteStr];
    }
}

//正文内容，如文本，图片等
- (void)setContentWithModel:(JRChatModel *)chatModel
{
    //_bgView中的视图是不确定的，不能复用，每次赋值移除之前视图，重新加新视图
    [_bgView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    switch (chatModel.messageBodyType) {
        case MessageBodyTypeText:
        {
            chatTextView = [[JRChatTextView alloc]initWithFrame:_bgView.bounds];
            [_bgView addSubview:chatTextView];
            chatTextView.chatModel = chatModel;
        }
            break;
        case MessageBodyTypePhoto:
        {
            chatImageView = [[JRChatImageView alloc]initWithFrame:_bgView.bounds];
            [_bgView addSubview:chatImageView];
            chatImageView.chatModel = chatModel;
        }
            break;
        default:
            break;
    }
}

//布局适配
- (void)setFrameWithModel:(JRChatModel *)chatModel
{
    _timeLabel.width = ScreenWidth;
    _timeLabel.height =  chatModel.isHideTime ? 0 : 25;
    
    _iconImageView.width = _iconImageView.height = kIconWH;
    _iconImageView.top = chatModel.isHideTime ? _timeLabel.height : (_timeLabel.height + 10);
    
    if (chatModel.conversationType == ConversationTypeChat) {
        _bgView.top = _iconImageView.top;
    }else{
        _nameLabel.top = _iconImageView.top;
        _nameLabel.height = 0.5 * kIconWH;
        _nameLabel.width = ScreenWidth;
        _bgView.top = _nameLabel.bottom;
    }
    _bgView.width = ScreenWidth;
    _bgView.height = chatModel.cellHeight;
    
    if ([chatModel.isMe isEqualToString:@"1"]) {
        _iconImageView.right = ScreenWidth - kInsetsBetweenIconAndScreen;
        _nameLabel.right =  _iconImageView.left - kInsetsBetweenIconAndBody - 10;
        _nameLabel.textAlignment = NSTextAlignmentRight;
        
    }else{
        _iconImageView.left = kInsetsBetweenIconAndScreen;
        _nameLabel.left = _iconImageView.right + kInsetsBetweenIconAndBody + 10;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
}

@end
