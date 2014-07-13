//
//  ZHClanVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-13.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHClanVc.h"

@interface ZHClanVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation ZHClanVc

- (id)init
{
    if (self = [super init]) {
        // Custom initialization
    }
    return self;
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
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, searchBar.bottom, self.view.width, self.view.height - (searchBar.height + 60)) style:UITableViewStylePlain];
    _sourceTable.backgroundColor = [UIColor yellowColor];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //kj
    return _sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
    return cell;
}
@end
