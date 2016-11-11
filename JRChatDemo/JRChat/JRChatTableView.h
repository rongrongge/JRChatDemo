//
//  JRChatTableView.h
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/13.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRChatTableView : UIView

@property (nonatomic, strong) UITableView *tableView;

//外部传来的数据
@property (nonatomic, strong) NSMutableArray *dataArr;

//初始化tableView
- (instancetype)initChatTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end
