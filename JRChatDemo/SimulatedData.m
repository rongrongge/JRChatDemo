//
//  SimulatedData.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/20.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "SimulatedData.h"

@implementation SimulatedData

- (NSArray *)getDataModelArr
{
    NSDate *date = [NSDate date];
    
    NSMutableArray *modelArr = [NSMutableArray array];
    for (int i = 0; i < 1000; i++) {
        NSArray *textArr = [self getTextDataModel:i%8];
        NSArray *photoArr = [self getPhotoDataModel:i%5];
        [modelArr addObjectsFromArray:textArr];
        [modelArr addObjectsFromArray:photoArr];
        NSLog(@".....");
    }
    
    //测试耗时
    NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:date];
    NSLog(@"use time: %@", @(time));
    return modelArr;
}

//模拟文本数据 0 =< n =< textArr.count;
- (NSArray *)getTextDataModel:(int)n
{
    NSDictionary *iconAndNameDic = [self configIconAndName];
    NSArray *textArr = @[@"你怎么这么帅啊",
                         @"没办法，就是这么帅，生不回去了。。。你怎么这么聪明呢？？？",
                         @"哈哈😄。。。。没看见我是光头么",
                         @"听说你兄弟吃蜂蜜吃多了，胖成猪了吧，😏😏😏。。。。以后再敢阻止我破坏森林，我就把你们兄弟当成猪🐷🐷给炖了。。。。😄哈😄哈。。。。。",
                         @"俺狗熊🐶🐻才不怕你呢",
                         @"哎呀呀，吃饱了撑的，不得了哈。。。。今天就让你看看俺光头强的厉害！！！！",
                         @"尽管放屁过来吧，俺老熊今天非灭了你不可！",
                         @"赶紧跑路。。。。。"];
    
    NSArray *timeArr = @[@"2015-10-17 16:15:02",
                         @"2016-07-23 16:15:32",
                         @"2016-09-23 16:17:02",
                         @"2016-09-29 16:18:02",
                         @"2016-09-30 05:25:02",
                         @"2016-09-30 16:25:02",
                         @"2016-10-01 05:19:02",
                         @"2016-10-01 17:15:02"];
    
    //单聊
    NSArray *chatIconArr = @[@"icon_1",@"icon_2",@"icon_1",@"icon_2",@"icon_1",@"icon_2",@"icon_1",@"icon_2"];
    NSMutableArray *chatNameArr = [NSMutableArray array];
    for (NSString *icon in chatIconArr) {
        [chatNameArr addObject:iconAndNameDic[icon]];
    }
    
    //群聊
    NSArray *groupChatIconArr = @[@"icon_7",@"icon_2",@"icon_1",@"icon_1",@"icon_4",@"icon_6",@"icon_4",@"icon_1"];
    NSMutableArray *groupChatNameArr = [NSMutableArray array];
    for (NSString *icon in groupChatIconArr) {
        [groupChatNameArr addObject:iconAndNameDic[icon]];
    }
    
    NSMutableArray *modelArr = [NSMutableArray array];
    for (int i = 0; i < n; i++) {
        
        JRChatModel *model = [[JRChatModel alloc]init];
        model.userModel = [[JRUserModel alloc]init];
        model.textModel = [[JRChatTextModel alloc]init];
        
        model.conversationType = self.conversationType;
        model.messageTime = timeArr[i];
        if (i) {
            model.lastMessageTime = timeArr[i-1];
        }else{
            model.lastMessageTime = @"1970-01-01 00:00:00";
        }
        model.userModel.userIcon = (model.conversationType == ConversationTypeChat) ? chatIconArr[i] : groupChatIconArr[i];
        model.userModel.userName = (model.conversationType == ConversationTypeChat) ? chatNameArr[i] : groupChatNameArr[i];
        model.textModel.textContent = textArr[i];
        model.isMe = [model.userModel.userName isEqualToString:@"光头强"] ? @"1" : @"0";
        model.messageBodyType = MessageBodyTypeText;
        
        [modelArr addObject:model];
    }
    return modelArr;
}

//模拟图片数据 4 >= n> = 0
- (NSArray *)getPhotoDataModel:(int)n
{
    NSDictionary *iconAndNameDic = [self configIconAndName];
    NSMutableArray *photoArr = [NSMutableArray array];
    
    for (int i = 8*n; i < 8*(n+1); i ++) {
        NSString *photoStr = [NSString stringWithFormat:@"baoManEmotion%d.jpg",i];
        [photoArr addObject:photoStr];
    }
    
    NSArray *timeArr = @[@"2016-10-11 09:15:02",
                         @"2016-10-11 09:15:02",
                         @"2016-10-12 10:17:02",
                         @"2016-10-12 10:18:02",
                         @"2016-10-13 01:25:02",
                         @"2016-10-14 10:25:02",
                         @"2016-10-18 20:19:02",
                         @"2016-10-19 20:15:02"];
    
    //单聊
    NSArray *chatIconArr = @[@"icon_1",@"icon_2",@"icon_1",@"icon_2",@"icon_1",@"icon_2",@"icon_1",@"icon_2"];
    NSMutableArray *chatNameArr = [NSMutableArray array];
    for (NSString *icon in chatIconArr) {
        [chatNameArr addObject:iconAndNameDic[icon]];
    }
    
    //群聊
    NSArray *groupChatIconArr = @[@"icon_1",@"icon_2",@"icon_3",@"icon_1",@"icon_4",@"icon_5",@"icon_1",@"icon_2"];
    NSMutableArray *groupChatNameArr = [NSMutableArray array];
    for (NSString *icon in groupChatIconArr) {
        [groupChatNameArr addObject:iconAndNameDic[icon]];
    }
    
    NSMutableArray *modelArr = [NSMutableArray array];
    for (int i = 0; i < photoArr.count; i++) {
        
        JRChatModel *model = [[JRChatModel alloc]init];
        model.userModel = [[JRUserModel alloc]init];
        model.imageModel = [[JRChatImageModel alloc]init];
        
        model.conversationType = self.conversationType;
        model.messageTime = timeArr[i];
        
#warning mark -在这里记录上一条消息的发送时间是有问题（只适用模拟数据），正式数据时，当前类会被删除，建议使用另外的方式记录上一条消息的发送时间
        if (i) {
            model.lastMessageTime = timeArr[i-1];
        }else{
            model.lastMessageTime = @"1970-01-01 00:00:00";
        }
        model.userModel.userIcon = (model.conversationType == ConversationTypeChat) ? chatIconArr[i] : groupChatIconArr[i];
        model.userModel.userName = (model.conversationType == ConversationTypeChat) ? chatNameArr[i] : groupChatNameArr[i];;
        model.imageModel.imageContent = photoArr[i];
        model.isMe = [model.userModel.userName isEqualToString:@"光头强"] ? @"1" : @"0";
        model.messageBodyType = MessageBodyTypePhoto;
        
        [modelArr addObject:model];
    }
    return modelArr;
}

//配置用户头像及对应的姓名
- (NSDictionary *)configIconAndName
{
    NSArray *iconArr = @[@"icon_1",@"icon_1",@"icon_2",@"icon_3",@"icon_4",@"icon_5",@"icon_6",@"icon_7"];
    NSArray *nameArr = @[@"光头强",@"熊大",@"灰大狼🐺",@"喜羊羊🌇yang",@"🐷和尚",@"孙悟空",@"西门庆",@"武大郎"];
    
    return @{iconArr[0]:nameArr[0],
             iconArr[1]:nameArr[1],
             iconArr[2]:nameArr[2],
             iconArr[3]:nameArr[3],
             iconArr[4]:nameArr[4],
             iconArr[5]:nameArr[5],
             iconArr[6]:nameArr[6],
             iconArr[7]:nameArr[7]};
}


@end
