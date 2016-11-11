//
//  ViewController.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/12.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "ViewController.h"
#import "JRChatModel.h"
#import "JRChatTableView.h"
#import "SimulatedData.h"
#import "ODRefreshControl.h"

@interface ViewController ()
{
    JRChatTableView *_chatView;
    NSInteger _totalPage;//总页数
    NSInteger _currentPage;//当前页数
    NSMutableArray *_chatDataArr;
}

@property (nonatomic, strong)  ODRefreshControl *refreshCtr;

@end

NSInteger perPage = 15;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.navigationController.title = @"光头强";
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:237/255.0 blue:241/255.0 alpha:1.0f];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _chatView = [[JRChatTableView alloc]initChatTableViewWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //设置模拟数据
    SimulatedData *simulatedData = [[SimulatedData alloc]init];
    simulatedData.conversationType = ConversationTypeGroupChat;//设置会话类型（群聊／单聊）
    
    NSMutableArray *dataArr = [NSMutableArray arrayWithArray:[simulatedData getDataModelArr]];
    _chatDataArr = [NSMutableArray array];
    
    _currentPage = 0;
    _totalPage = (dataArr.count % perPage) ? (dataArr.count/perPage + 1) : (dataArr.count/perPage);

    //将模拟数据切分成若干个数组，再将切分后的数组添加到新的数组，用于数据的分页显示
    for (int i = ((int)_totalPage-1); i>=0; i--) {
        NSArray *arr;
        if (i == _totalPage - 1) {
            NSInteger n = ((dataArr.count % perPage)==0) ? perPage : (dataArr.count % perPage);
            arr = [dataArr subarrayWithRange:NSMakeRange(i*perPage, n)];
        }else{
            arr = [dataArr subarrayWithRange:NSMakeRange(i*perPage, perPage)];
        }
        [_chatDataArr addObject:arr];
    }
    NSLog(@"共 %ld 条数据",dataArr.count);
    [_chatView.dataArr addObjectsFromArray:_chatDataArr[_currentPage]];
    [_chatView.tableView scrollToBottomWithAnimated:NO];
    [self.view addSubview:_chatView];
    
    //下拉刷新
    _refreshCtr = [[ODRefreshControl alloc] initInScrollView:_chatView.tableView];
    [_refreshCtr addTarget:self action:@selector(loadMoreMsg) forControlEvents:UIControlEventValueChanged];
}

//加载更多信息
- (void)loadMoreMsg
{
    _currentPage ++;
    if (_currentPage <= _totalPage) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            NSInteger newRows = perPage;
            NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:newRows inSection:0];
            
            //在数据源数组第一个元素前面插入一个新的数组
            [_chatView.dataArr replaceObjectsInRange:NSMakeRange(0, 0)withObjectsFromArray:_chatDataArr[_currentPage]];
            [_chatView.tableView reloadData];
            
            [_chatView.tableView scrollToRowAtIndexPath:currentIndexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
            [_refreshCtr endRefreshing];
        });
    }else{
        [_refreshCtr endRefreshing];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
