//
//  ZHPersonSettingVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-3.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHPersonSettingVc.h"
#import "PJDetailSetVc.h"

#define PHONE_NUMBER @"4000080080"

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
                         @"item":@[@{@"title":@"消息设置",@"class":@"PJDetailSetVc",@"type":@(ZHSettingTypeMessage)},
                                   @{@"title":@"隐私",@"class":@"PJDetailSetVc",@"type":@(ZHSettingTypePrivacy)}]},
                       @{@"head":@"",
                         @"item":@[@{@"title":@"检查新版本",@"action":@"正在检查新版本..."},
                                   @{@"title":[NSString stringWithFormat:@"客服热线：%@",PHONE_NUMBER],@"telphone":[NSString stringWithFormat:@"tel:%@",PHONE_NUMBER]},
                                   @{@"title":@"关于",@"class":@"PJDetailSetVc",@"type":@(ZHSettingTypeAbout)}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"接收手机报彩信",@"switch":@""}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"服务条款",@"class":@""}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"网络检测",@"class":@"PJDetailSetVc",@"type":@(ZHSettingTypeNetTest)}]},
                       @{@"head": @"",
                         @"item": @[@{@"title":@"清除缓存",@"action":@"正在清除缓存..."},@{@"title":@"清除搜索历史",@"action":@"正在清除搜索历史..."},@{@"title":@"清空所有聊天记录",@"alert":@"此操作将删除所有聊天记录，是否继续？"}]},
                       @{@"head": @""}];
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
    
    UIButton *footBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
    footBtn.backgroundColor = [UIColor whiteColor];
    [footBtn setTitle:@"退出当前账号" forState:UIControlStateNormal];
    [footBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [footBtn addTarget:self action:@selector(exitAppBtn:) forControlEvents:UIControlEventTouchUpInside];
    _sourceTable.tableFooterView = footBtn;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
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
    if (item[@"telphone"]) {
        NSString *str = item[@"telphone"];
        UIWebView *callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
    } else if (item[@"action"]) {
        [self show:item[@"action"] afterDelay:2];
    }
    if (item[@"alert"]) {
        [UIAlertView alertViewWithTitle:nil message:item[@"alert"] cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] onDismiss:^(int buttonIndex) {
            [self showSuccess:@"删除所有聊天记录成功"];
        } onCancel:nil];
    }
    if (item[@"type"]) {
        PJDetailSetVc *nextVc = [[PJDetailSetVc alloc] initWithSetType:[item[@"type"] intValue]];
        [self.navigationController pushViewController:nextVc animated:YES];
    }
}

- (void)exitAppBtn:(UIButton *)btn
{
    [UIAlertView alertViewWithTitle:@"注销用户" message:@"确认注销用户吗？" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] onDismiss:^(int buttonIndex) {
        [self showSuccess:@"注销用户成功"];
    } onCancel:nil];
}

@end
