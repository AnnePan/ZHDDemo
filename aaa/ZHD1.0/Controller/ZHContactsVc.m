//
//  ZHContactsVc.m
//  ZHD

//  Created by 王 宝安 on 14-6-18.
//  Copyright (c) 2014年 wba. All rights reserved.


#import "ZHContactsVc.h"
#import "ZHRequestAPI.h"
#import "PJUserModel.h"
#import "ZHFindCell.h"
#import "ZHPersonCardVc.h"

@interface ZHContactsVc() <UITableViewDataSource, UITableViewDelegate>
{
    
    NSArray *_sourceArr;
    NSMutableArray *_searchArr;//搜索后数据
    NSMutableArray *_firstWordArray;
    UITableView    *_sourceTable;
    UISearchBar    *_searchBar;
    UISearchDisplayController *_searchController;
}

@end

@implementation ZHContactsVc

#pragma mark - request data
- (void)requestData
{
    if (!_sourceArr) {
        _sourceArr = [[NSArray alloc] init];
    }
    if (!_searchArr) {
        _searchArr = [[NSMutableArray alloc] init];
    }
    _sourceArr = [self sortList:[ZHRequestAPI requestContacts]];
}

- (NSArray *)sortList:(NSArray *)userArr
{
    NSMutableArray *userArray = [[NSMutableArray alloc] init];
    NSMutableArray *firstWordArr = [[NSMutableArray alloc] init];
    NSMutableSet *orderedSet=[[NSMutableSet alloc]init];
    for (PJUserModel *user in userArr){
        [orderedSet addObject:[user.uFirstWord substringWithRange:NSMakeRange(0, 1)]];
    }
    //得到头字母
    for (NSString *firstWord in orderedSet){
        [firstWordArr addObject:firstWord];
    }
    //为头字母排序
    [firstWordArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return  [obj1 compare:obj2];
    }];
    _firstWordArray = firstWordArr;
    
    for (NSString *firstWord in firstWordArr){
        NSMutableArray *arrc=[[NSMutableArray alloc] init];
        for (PJUserModel *user in userArr){
            if([[user.uFirstWord substringWithRange:NSMakeRange(0, 1)] isEqualToString:firstWord]){
                [arrc addObject:user];
            }
        }
        NSMutableDictionary *keyAndArray=[[NSMutableDictionary alloc] init];
        [keyAndArray setObject:arrc forKey:@"arr"];
        [keyAndArray setObject:firstWord forKey:@"firstWord"];
        [userArray addObject:keyAndArray];
    }
    return userArray;
}//排序

- (id)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}

#warning 高度需注意
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, self.view.width, 44)];
    _searchBar.placeholder = @"快速筛选";
    _searchController = [[UISearchDisplayController alloc]initWithSearchBar:_searchBar contentsController:self];
    _searchController.searchResultsDataSource = self;
    _searchController.searchResultsDelegate = self;
    [self.view addSubview:_searchBar];
    
    // 通讯录
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, _searchBar.bottom, self.view.width, self.view.height - (_searchBar.height + 63))];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [self.view addSubview:_sourceTable];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - UITableViewDataSource
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
        return [_sourceArr[section][@"arr"] count];
    } else {
        [_searchArr removeAllObjects];
        for(PJUserModel *itm in _sourceArr[section][@"arr"]) {
            NSString *content = [itm.uName lowercaseString];
            NSString *searchBarText = [_searchBar.text lowercaseString];
            NSRange range = [content rangeOfString:searchBarText];
            if(range.location != NSNotFound) {
                [_searchArr addObject:itm];
            }
        }
        return [_searchArr count];
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _firstWordArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHFindCell *cell = [_sourceTable dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[ZHFindCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(self.class)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    PJUserModel *item;
    if(tableView == _sourceTable) {
        item = _sourceArr[indexPath.section][@"arr"][indexPath.row];
    } else {
        item = _searchArr[indexPath.row];
    }
    [cell setUserItem:item];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(tableView == _sourceTable) {
        return _sourceArr[section][@"firstWord"];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHPersonCardVc *personCard = [[ZHPersonCardVc alloc] initWithUserId:@"123"];
    [self.navigationController pushViewController:personCard animated:YES];
}


@end
