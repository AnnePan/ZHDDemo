//
//  ZHPersonSettingVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-3.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHPersonSettingVc.h"

@interface ZHPersonSettingVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation ZHPersonSettingVc

- (id)init
{
    if (self = [super init]) {
        _sourceArr = @[@{@"head":@"",
                         @"item":@[@{@"title":@"消息设置",@"class":@""},
                                   @{@"title":@"隐私",@"class":@"PJDetailSetVc"}]},
                       @{@"head":@"",
                         @"item":@[@{@"title":@"检查新版本"},
                                   @{@"title":@"客服热线:"},
                                   @{@"title":@"关于",@"class":@""}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"接收手机报彩信",@"switch":@""}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"服务条款",@"class":@""}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"网络检测",@"class":@""}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"清除缓存"},@{@"title":@"清除搜索历史"},@{@"title":@"清空所有聊天记录"}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"退出当前账号"}]}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = YES;
    
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.width, self.view.height - 68) style:UITableViewStylePlain];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    _sourceTable.tableFooterView = [UIView new];
    [self.view addSubview:_sourceTable];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:nil];
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
    [cell setAccessoryView:nil];
    cell.accessoryType= UITableViewCellAccessoryNone;
    cell.textLabel.text = _sourceArr[indexPath.section][@"item"][indexPath.row][@"title"];
    if (_sourceArr[indexPath.section][@"item"][indexPath.row][@"class"]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (_sourceArr[indexPath.section][@"item"][indexPath.row][@"switch"]) {
        UISwitch *switctV = [[UISwitch alloc] init];
        [cell setAccessoryView:switctV];
    }
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
