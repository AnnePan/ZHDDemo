//
//  ZHRecommendDetailVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-24.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHRecommendDetailVc.h"
#import "PJUserModel.h"
#import "ZHRequestAPI.h"
#import "ZHFindCell.h"

@interface ZHRecommendDetailVc () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
    PJUserModel *_frwordUser;
}

@end

@implementation ZHRecommendDetailVc

- (id)initWithUser:(PJUserModel *)item
{
    if (self = [super init]) {
        _frwordUser = item;
        [self requestDataByUserId:item.uId];
    }
    return self;
}

- (void)requestDataByUserId:(NSString *)uId;
{
    if (!_sourceArr) {
        _sourceArr = [[NSArray alloc] init];
    }
    _sourceArr = [ZHRequestAPI requestContacts];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _sourceTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _sourceTable.height = _sourceTable.height - 113;
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    _sourceTable.rowHeight = 70;
    [self.view addSubview:_sourceTable];
    
    [self initHeaderView];
}

- (void)initHeaderView
{
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _sourceTable.width, 130)];
    _sourceTable.tableHeaderView = headerV;
    
    UIImageView *headIv = [[UIImageView alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceLarge, headerV.height - (ZHSysSpaceLarge * 2), headerV.height - (ZHSysSpaceLarge * 2))];
    headIv.layer.masksToBounds = YES;
    headIv.layer.contentsScale = headIv.width / 2;
    headIv.image = [UIImage imageNamed:_frwordUser.uPicPath];
    [headerV addSubview:headIv];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PJUserModel *user = _sourceArr[indexPath.row];
    ZHFindCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[ZHFindCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
    }
    [cell setUserItem:user];
    return cell;
}

@end
