//
//  ZHFindDetailVc.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-23.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHFindDetailVc.h"

@interface ZHFindDetailVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
    NSString *_titleStr;
}

@end

@implementation ZHFindDetailVc

- (id)initWithDic:(NSDictionary *)item
{
    if (self = [super init]) {
        if ([item[@"value"] isKindOfClass:NSArray.class]) {
            _sourceArr = [NSArray arrayWithArray:item[@"value"]];
            _titleStr = item[@"key"];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _titleStr;
    
    _sourceTable = [[UITableView alloc] initWithFrame:self.view.frame];
    _sourceTable.delegate = self;
    _sourceTable.dataSource = self;
    _sourceTable.tableFooterView = [UIView new];
    [_sourceTable registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(self.class)];
    [self.view addSubview:_sourceTable];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
    cell.textLabel.text = _sourceArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - memory manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
