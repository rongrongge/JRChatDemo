//
//  JRChatTableView.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/13.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "JRChatTableView.h"
#import "JRChatCell.h"

@interface JRChatTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JRChatTableView


-(NSMutableArray *)dataArr
{
    if (_dataArr == nil)
    {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (instancetype)initChatTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self == [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc] initWithFrame:frame style:style];
        
        [self addSubview:self.tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView registerClass:[JRChatCell class] forCellReuseIdentifier:@"JRChatCellID"];
    }
    return self;
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JRChatModel *model = self.dataArr[indexPath.row];
    JRChatCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"JRChatCellID" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.chatModel = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JRChatModel *model = self.dataArr[indexPath.row];
    return [model getCellHeight];
}


@end
