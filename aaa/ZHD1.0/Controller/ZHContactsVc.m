//
//  ZHContactsVc.m
//  ZHD

//  Created by 王 宝安 on 14-6-18.
//  Copyright (c) 2014年 wba. All rights reserved.


#import "ZHContactsVc.h"
#import "PJUserModel.h"
#import "PJUser1Cell.h"

@interface ZHContactsVc() <UITableViewDataSource, UITableViewDelegate>
{
    
    NSMutableArray *_sourceArr;
    NSMutableArray *_getUserDataList,*_getFirstCharList;
    UITableView    *_sourceTable;
    UISearchBar    *_searchBar;
    
}

@end

@implementation ZHContactsVc

#pragma mark - request data
- (void)requestData{
    _sourceArr = [[NSMutableArray alloc] init];
    _getUserDataList = [[NSMutableArray alloc] init];
    _getFirstCharList = [[NSMutableArray alloc] init];
    NSArray *sections = @[@"A",@"B",@"C",@"D"];
    for (int i = 0; i < sections.count; i++) {
        for (int j = 0; j < 3; j++) {
            PJUserModel *user = [[PJUserModel alloc] init];
            user.uName = [NSString stringWithFormat:@"%@张三%d",sections[i],j];
            user.uFirstWord = sections[i];
            user.uPicPath = @"all_group";
            user.uCompany = @"中华医学会砖家";
            [_sourceArr addObject:user];
        }
    }
    [self sortList];
}

- (void)sortList
{
    NSMutableSet *orderedSet=[[NSMutableSet alloc]init];
    for (PJUserModel *user in _sourceArr){
        [orderedSet addObject:[user.uFirstWord substringWithRange:NSMakeRange(0, 1)]];
    }
    
    for (NSString *firstWord in orderedSet){
        [_getFirstCharList addObject:firstWord];
        NSMutableArray *arrc=[[NSMutableArray alloc] init];
        for (PJUserModel *data in _sourceArr){
            if([[data.uFirstWord substringWithRange:NSMakeRange(0, 1)] isEqualToString:firstWord]){
                [arrc addObject:data];
            }
        }
        NSMutableDictionary *keyAndArray=[[NSMutableDictionary alloc] init];
        [keyAndArray setObject:arrc forKey:@"arr"];
        [keyAndArray setObject:firstWord forKey:@"firstWord"];
        [_getUserDataList addObject:keyAndArray];
    }
    
    [_getFirstCharList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    [_getUserDataList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return  [[obj1 objectForKey:@"firstWord"] compare:[obj2 objectForKey:@"firstWord"]];
    }];
    NSLog(@"_getUserDataList == %@",_getUserDataList);
    
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
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 44)];
    _searchBar.placeholder = @"快速筛选";
    [self.view addSubview:_searchBar];
    
    // 通讯录
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, _searchBar.bottom, self.view.width, self.view.height - _searchBar.height)];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [_sourceTable registerClass:[PJUser1Cell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_getUserDataList[section][@"arr"] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _getFirstCharList;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PJUserModel *user = _getUserDataList[indexPath.section][@"arr"][indexPath.row];
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
    return [_getFirstCharList objectAtIndex:section];;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_getUserDataList count];
}
@end
