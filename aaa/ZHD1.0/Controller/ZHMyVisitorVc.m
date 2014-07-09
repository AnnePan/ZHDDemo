//
//  ZHMyVisitorVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-3.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHMyVisitorVc.h"
#import "PJUserModel.h"
#import "ZHMyVisitorCell.h"
#import "ZHPersonCardVc.h"

@interface ZHMyVisitorVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_sourceArr;  // 数据源
    UITableView *_listTable;     // 列表
}

@end

@implementation ZHMyVisitorVc

- (id)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}

- (void)requestData
{
    if (!_sourceArr) {
        _sourceArr = [[NSMutableArray alloc] init];
    }
    for (int i = 0 ; i < 10; i++) {
        PJUserModel *user = [[PJUserModel alloc] init];
        user.uPicPath = @"all_group";
        user.uName = [NSString stringWithFormat:@"访客%d",i];
        user.uCompany = @"怡康生物科技有限公司总经理";
        [_sourceArr addObject:user];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _listTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    _listTable.dataSource = self;
    _listTable.delegate = self;
    [_listTable registerClass:[ZHMyVisitorCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    [self.view addSubview:_listTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHMyVisitorCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
    [cell setItem:_sourceArr[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHPersonCardVc *personCard = [[ZHPersonCardVc alloc] initWithUserId:@"123"];
    [self.navigationController pushViewController:personCard animated:YES];
}

@end
