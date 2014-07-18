//
//  PJFindVc.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-17.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHFindVc.h"
#import "ZHFindCell.h"
#import "ZHRequestAPI.h"

@interface ZHFindVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation ZHFindVc

- (id)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}

- (void)requestData{
    if (!_sourceArr) {
        _sourceArr = [[NSMutableArray alloc] init];
    }
    _sourceArr = [ZHRequestAPI requestIndustry];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"岛上找人";
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
    searchBar.placeholder = @"输入关键字搜索";
    [self.view addSubview:searchBar];
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, searchBar.bottom, self.view.width, self.view.height - (searchBar.height + 63 + 50))];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [_sourceTable registerClass:[ZHFindCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArr[section][@"rowText"] count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sourceArr[section][@"sectionText"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = _sourceArr[indexPath.section][@"rowText"][indexPath.row];
    ZHFindCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
    [cell setItem:item];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sourceArr count];
}
@end
