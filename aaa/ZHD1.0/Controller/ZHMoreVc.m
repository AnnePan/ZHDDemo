//
//  ZHMoreVc.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-22.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHMoreVc.h"

@interface ZHMoreVc () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_sourceTable;
    NSArray *_sourceArr;
}

@end

@implementation ZHMoreVc

- (id)init
{
    if (self = [super init]) {
        _sourceArr = @[@{@"head":@"",
                         @"item":@[@{@"title":@"广场分享",@"class":@"ZHCentreShareVc"}]},
                       @{@"head":@"",
                         @"item":@[@{@"title":@"金火种",@"class":@"ZHGoldFireVc"}]},
                       @{@"head":@"",
                         @"item":@[@{@"title":@"每日一问",@"class":@"ZHEveryDayqVc"},
                                   @{@"title":@"手机报",@"class":@"ZHPhoneNewsVc"},
                                   @{@"title":@"微访谈",@"class":@""},
                                   @{@"title":@"微讲坛",@"class":@""}]},
                       @{@"head":@"",
                         @"item":@[@{@"title":@"草稿箱",@"class":@""},
                                   @{@"title":@"收藏夹",@"class":@""},
                                   @{@"title":@"微收藏",@"class":@""}],
                         @"foot":@""}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    [cell setAccessoryView:nil];
//    cell.accessoryType= UITableViewCellAccessoryNone;

    if (_sourceArr[indexPath.section][@"item"][indexPath.row][@"title"]) {
        cell.textLabel.text = _sourceArr[indexPath.section][@"item"][indexPath.row][@"title"];
    }
    if (_sourceArr[indexPath.section][@"item"][indexPath.row][@"class"]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sourceArr[section][@"head"] ? @" " : nil ;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return _sourceArr[section][@"foot"] ? @" " : nil ;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_sourceArr[indexPath.section][@"item"][indexPath.row][@"image"]) {
        UIImage *iv = [UIImage imageNamed:_sourceArr[indexPath.section][@"item"][indexPath.row][@"image"]];
        return iv.size.height;
    }
    return 50;
}


@end
