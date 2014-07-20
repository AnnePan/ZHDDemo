//
//  ZHContactsVc.m
//  ZHD

//  Created by 王 宝安 on 14-6-18.
//  Copyright (c) 2014年 wba. All rights reserved.


#import "ZHContactsVc.h"
#import "PJUserModel.h"
#import "PJUser1Cell.h"
#import "ZHRequestAPI.h"

@interface ZHContactsVc() <UITableViewDataSource, UITableViewDelegate>
{
    
    NSArray *_sourceArray;
    NSMutableArray *_firstWordArray;
    UITableView    *_sourceTable;
    UISearchBar    *_searchBar;
    
}

@end

@implementation ZHContactsVc

#pragma mark - request data
- (void)requestData
{
    if (!_sourceArray) {
        _sourceArray = [[NSMutableArray alloc] init];
    }
    _sourceArray = [self sortList:[ZHRequestAPI requestContacts]];
}

- (NSArray *)sortList:(NSArray *)userArr
{
    NSMutableArray *userArray = [[NSMutableArray alloc] init];
    NSMutableArray *firstWordArr = [[NSMutableArray alloc] init];
    NSMutableSet *orderedSet=[[NSMutableSet alloc]init];
    for (PJUserModel *user in userArr){
        [orderedSet addObject:[user.uFirstWord substringWithRange:NSMakeRange(0, 1)]];
    }
    
    for (NSString *firstWord in orderedSet){
        [firstWordArr addObject:firstWord];
    }
    
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
}

- (id)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useDefaultColor];
    [self useiOS7BeforeStyle];
    
    // 搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 18, self.view.width, 44)];
    _searchBar.placeholder = @"快速筛选";
    [self.view addSubview:_searchBar];
    
    // 通讯录
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, _searchBar.bottom, self.view.width, self.view.height - (_searchBar.height + 63))];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [_sourceTable registerClass:[PJUser1Cell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArray[section][@"arr"] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _firstWordArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PJUserModel *user = _sourceArray[indexPath.section][@"arr"][indexPath.row];
    PJUser1Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    [cell setItem:user];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sourceArray[section][@"firstWord"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sourceArray count];
}

@end
