//
//  PJDetailSetVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-6.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJDetailSetVc.h"

@interface PJDetailSetVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation PJDetailSetVc

- (id)init
{
    return [self initWithSetType:ZHSettingTypePrivacy];
}

- (id)initWithSetType:(ZHSettingType)type
{
    if (self = [super init]) {
        _sourceArr = [self sourceArrayByType:type];
    }
    return self;
}

- (NSArray *)sourceArrayByType:(ZHSettingType)type
{
    switch (type) {
        case ZHSettingTypeMessage:
        {
            self.title = @"消息设置";
            return @[@{@"head": @"",
                       @"item": @[@{@"title":@"黑名单",@"class":@""},@{@"title":@"加我为好友时需要验证",@"switch":@""}]}];
            break;
        }
        case ZHSettingTypePrivacy:
        {
            self.title = @"隐私";
            return @[@{@"head": @"",
                       @"item": @[@{@"title":@"黑名单",@"class":@""},@{@"title":@"加我为好友时需要验证",@"switch":@""}]}];
            break;
        }
            
            
        default:
            break;
    }
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    
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
