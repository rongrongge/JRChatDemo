//
//  UITableView+ScrollToBottom.m
//  JRChatDemo
//
//  Created by 谢建荣 on 16/10/21.
//  Copyright © 2016年 Ping An Health Insurance Company of China. All rights reserved.
//

#import "UITableView+ScrollToBottom.h"

@implementation UITableView (ScrollToBottom)

- (void)scrollToBottomWithAnimated:(BOOL)animated
{
    if ([self numberOfSections] > 0) {
        NSInteger lastSectionIndex = [self numberOfSections] - 1;
        NSInteger lastRowIndex = [self numberOfRowsInSection:lastSectionIndex] - 1;
        if (lastRowIndex > 0) {
            NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:lastRowIndex inSection:lastSectionIndex];
            [self scrollToRowAtIndexPath:lastIndexPath atScrollPosition: UITableViewScrollPositionBottom animated:animated];
        }
    }
}

@end
