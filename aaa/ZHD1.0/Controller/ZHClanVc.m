//
//  ZHClanVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-13.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHClanVc.h"
#import "ZHRequestAPI.h"
#import "ZHClanCell.h"
#import "ZHClanDeatilVc.h"
#import "ZHClanModel.h"

@interface ZHClanVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation ZHClanVc

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
    [_sourceArr addObjectsFromArray:[ZHRequestAPI requestClans]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"部落";
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
    searchBar.placeholder = @"输入关键字搜索";
    [self.view addSubview:searchBar];
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, searchBar.bottom, self.view.width, self.view.height - (searchBar.height + 63 + 50)) style:UITableViewStylePlain];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [_sourceTable registerClass:[ZHClanCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHClanCell *cell  = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
    [cell setItem:_sourceArr[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHClanModel *item = _sourceArr[indexPath.row];
    ZHClanDeatilVc *nextVc = [[ZHClanDeatilVc alloc] initWithTitle:item.cName];
    [self.navigationController pushViewController:nextVc animated:YES];
}
@end
