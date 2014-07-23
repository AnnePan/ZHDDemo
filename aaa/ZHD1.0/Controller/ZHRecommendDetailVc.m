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

@interface ZHRecommendDetailVc ()
{
    NSDictionary *_sourceDic;
    UITableView *_sourceTable;
    PJUserModel *_frwordUser;
}

@end

@implementation ZHRecommendDetailVc

- (id)initWithUser:(PJUserModel *)item;
{
    if (self = [super init]) {
        _frwordUser = item;
        [self requestDataByUserId:item.uId];
    }
    return self;
}

- (void)requestDataByUserId:(NSString *)uId;
{
    if (!_sourceDic) {
        _sourceDic = [[NSMutableDictionary alloc] init];
    }
    [_sourceDic setValue:[ZHRequestAPI requestContacts] forKey:@"items"];
}

- (void)viewDidLoad
{
    _sourceTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
//    _sourceTable.dataSource = self;
//    _sourceTable.delegate = self;
    [self.view addSubview:_sourceTable];
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _sourceTable.width, 130)];
    _sourceTable.tableHeaderView = headerV;
    
}
@end
