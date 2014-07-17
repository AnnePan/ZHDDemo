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
#import "PJUserModel.h"

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
    _sourceArr = [self sortList:[NSArray arrayWithArray:[ZHRequestAPI requestContacts]]];
}
- (NSArray *)sortList:(NSArray *)arr
{
    NSMutableArray *sortedfArr = [NSMutableArray array];
    NSMutableSet *orderedSet=[[NSMutableSet alloc]init];
    for (PJUserModel *user in arr){
        [orderedSet addObject:user.uFirstWord];
    }
    
    for (NSString *firstWord in orderedSet){
        NSMutableArray *arrc=[[NSMutableArray alloc] init];
        for (PJUserModel *data in arr){
            if([[data.uFirstWord substringWithRange:NSMakeRange(0, 1)] isEqualToString:firstWord]){
                [arrc addObject:data];
            }
        }
        NSMutableDictionary *keyAndArray=[[NSMutableDictionary alloc] init];
        [keyAndArray setObject:firstWord forKey:@"firstWord"];
        [keyAndArray setObject:arrc forKey:@"arr"];
        [sortedfArr addObject:keyAndArray];
    }
    [sortedfArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return  [[obj1 objectForKey:@"firstWord"] compare:[obj2 objectForKey:@"firstWord"]];
    }];
    return sortedfArr;
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
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, searchBar.bottom, self.view.width, self.view.height - (searchBar.height + 60))];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [_sourceTable registerClass:[ZHFindCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArr[section][@"arr"] count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sourceArr[section][@"firstWord"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PJUserModel *user = _sourceArr[indexPath.section][@"arr"][indexPath.row];
    ZHFindCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
    [cell setItem:user];
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
