//
//  PJDetailUpdataVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-6.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJDetailUpdataVc.h"

@interface PJDetailUpdataVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation PJDetailUpdataVc

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.updataType == ZHUpdataTypeCompany) {
        self.title = @"企业资料";
        _sourceArr = @[@{@"head": @"",
                         @"item": @[@{@"title":@"企业名（必填）"},@{@"title":@"详情说明（必填）"}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"地址（选填）"},@{@"title":@"网址（选填）"}]}];
    } else {
        self.title = @"？？？？";
    }
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    _sourceTable.tableFooterView = [UIView new];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArr[section][@"item"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    NSDictionary *item = _sourceArr[indexPath.section][@"item"][indexPath.row];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
        UITextField *cellField = [[UITextField alloc] initWithFrame:cell.bounds];
        cellField.tag = 20;
        [cell addSubview:cellField];
    }
    UITextField *cellField1 = [cell viewWithTag:20];
    cellField1.placeholder = item[@"title"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //    return _sourceArr[section][@"head"];
    if (section == 0) {
        return nil;
    }
    return @" ";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sourceArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = _sourceArr[indexPath.section][@"item"][indexPath.row];
    if (item[@"class"]) {
        UIViewController *nextVc = [[NSClassFromString(item[@"class"]) alloc] init];
        [self.navigationController pushViewController:nextVc animated:YES];
    }
}

@end
