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
    NSMutableArray *_searchArr;
    NSMutableArray *_sourceArr;
    UITableView *_sourceTable;
    UISearchBar *_searchBar;
    UISearchDisplayController *_searchController;
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
    if (!_searchArr) {
        _searchArr = [[NSMutableArray alloc] init];
    }
    [_sourceArr addObjectsFromArray:[ZHRequestAPI requestIndustry]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"岛上找人";
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - (_searchBar.height + 63 + 50))];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [self.view addSubview:_sourceTable];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 44)];
    _searchBar.placeholder = @"输入关键字搜索";
    _searchController = [[UISearchDisplayController alloc]initWithSearchBar:_searchBar contentsController:self];
    _searchController.searchResultsDataSource = self;
    _searchController.searchResultsDelegate = self;
    _sourceTable.tableHeaderView = _searchBar;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //表示当前tableView视图
    if(tableView == _sourceTable) {
        return [_sourceArr count];
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //表示当前tableView视图
    if(tableView == _sourceTable) {
        return [_sourceArr[section][@"rowText"] count];
    } else {
        [_searchArr removeAllObjects];
        for(NSDictionary *itm in _sourceArr[section][@"rowText"]) {
            NSString *content = [itm[@"key"] lowercaseString];
            NSString *searchBarText = [_searchBar.text lowercaseString];
            NSRange range = [content rangeOfString:searchBarText];
            if(range.location != NSNotFound) {
                [_searchArr addObject:itm];
            }
        }
        return [_searchArr count];
    }
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(tableView == _sourceTable) {
        return _sourceArr[section][@"sectionText"];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHFindCell *cell = [_sourceTable dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[ZHFindCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(self.class)];
    }
    NSDictionary *item;
    if(tableView == _sourceTable) {
        item = _sourceArr[indexPath.section][@"rowText"][indexPath.row];
    } else {
        item = _searchArr[indexPath.row];
    }
    [cell setItem:item];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}



@end
