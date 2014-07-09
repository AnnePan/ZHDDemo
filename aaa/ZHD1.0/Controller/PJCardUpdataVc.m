//
//  PJCardUpdataVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-6.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJCardUpdataVc.h"

@interface PJCardUpdataVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation PJCardUpdataVc

- (id)init
{
    if (self = [super init]) {
        _sourceArr = @[@{@"head":@" ",
                         @"item":@[@{@"title":@"个人头像",@"class":@""}]},
                       @{@"head":@"让更多对的人找到你，请完善个人信息",
                         @"item":@[@{@"title":@"擅长或经验",@"subTitle":@[],@"defindSub":@"您的企业经营管理特长",@"class":@""},
                                   @{@"title":@"所在行业",@"subTitle":@[],@"defindSub":@"您的企业所在的行业",@"class":@""},
                                   @{@"title":@"企业信息",@"subTitle":@[],@"defindSub":@"您的企业介绍",@"class":@"PJDetailUpdataVc"},
                                   @{@"title":@"关注的行业",@"subTitle":@[],@"defindSub":@"添加您关注的行业",@"class":@""}]},
                       @{@"head": @" ",
                         @"item": @[@{@"title":@"自我介绍",@"subTitle":@[],@"defindSub":@"您的详细介绍",@"class":@""},
                                    @{@"title":@"社会职务",@"subTitle":@[],@"defindSub":@"您担任的社会职务",@"class":@""},
                                    @{@"title":@"兴趣爱好",@"subTitle":@[],@"defindSub":@"您的兴趣爱好",@"class":@""},
                                    @{@"title":@"城市",@"subTitle":@[],@"defindSub":@"家乡、常驻地、常来往城市",@"class":@""},
                                    @{@"title":@"学习经历",@"subTitle":@[],@"defindSub":@"您的教育经历",@"class":@""}]},
                       
                       @{@"head": @"联系方式－填写后会公开显示，可不填写",
                         @"item": @[@{@"title":@"手机号码",@"subTitle":@[],@"defindSub":@"您的电话号码",@"class":@""},
                                    @{@"title":@"邮箱",@"subTitle":@[],@"defindSub":@"您的邮箱地址",@"class":@""}]}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    _sourceTable.rowHeight = 60;
    _sourceTable.tableFooterView = [UIView new];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArr[section][@"item"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    NSDictionary *item = _sourceArr[indexPath.section][@"item"][indexPath.row];
    UILabel *lab = nil;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass(self.class)];
        lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = item[@"title"];
    NSArray *arr = item[@"subTitle"];
    if (arr.count > 0) {
        lab.text = @"已填写";
    } else {
        lab.text = @"未填写";
        cell.detailTextLabel.text = item[@"defindSub"];
    }
    [cell setAccessoryView:lab];
    if (item[@"switch"]) {
        UISwitch *switctV = [[UISwitch alloc] init];
        [cell setAccessoryView:switctV];
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sourceArr[section][@"head"];
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
