//
//  ZHRefreshLoadView.m
//  ZHD
//
//  Created by 王 宝安 on 14-6-20.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "ZHRefreshLoadView.h"
#import "MJRefresh.h"

@interface ZHRefreshLoadView () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    ZHRefreshLoadViewType _type;
    NSMutableArray *_infos;
}
@end

@implementation ZHRefreshLoadView

- (id)initWithFrame:(CGRect)frame type:(ZHRefreshLoadViewType)type
{
    if (self = [super initWithFrame:frame]) {
        _type = type;
        _infos = [NSMutableArray new];
        for (int i=0; i < 2; i++) {
            NSString *string = [NSString stringWithFormat:@"%d",i];
            [_infos addObject:string];
        }
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        [self setupRefresh];
    }
    return self;
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
#warning 自动刷新(一进入程序就下拉刷新)
    [_tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}


- (void)footerRereshing
{
    // 1.添加假数据
//    for (int i = 0; i<5; i++) {
//        [_infos addObject:MJRandomData];
//    }
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [_tableView footerEndRefreshing];
    });
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    // 1.添加假数据
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [_tableView headerEndRefreshing];
    });
}

#pragma mark -UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_infos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    NSString *string = [_infos objectAtIndex:indexPath.row];
    cell.textLabel.text = string;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewController.navigationController pushViewController:_pushVc animated:YES];
}

@end
