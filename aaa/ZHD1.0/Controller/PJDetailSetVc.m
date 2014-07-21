//
//  PJDetailSetVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-6.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "PJDetailSetVc.h"
#import "NSString+Additions.h"

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
            return @[@{@"item": @[@{@"title":@"接收新消息通知",@"detail":@"已关闭"}],
                       @"foot":@"如果您要关闭或开启一之岛的新消息通知，请再iPhone“设置”－“通知”功能中，找到“一之岛”进行更改。"},
                     @{@"item": @[@{@"title":@"声音",@"switch":@""},@{@"title":@"震动",@"switch":@""}],
                       @"foot":@"当正和岛在运行时，你可以设置是否需要声音或者震动"},
                     @{@"item": @[@{@"title":@"消息免打扰",@"class":@""}],
                       @"foot":@"设置系统功能消息提示声音和震动的时段"}];
            break;
        }
        case ZHSettingTypePrivacy:
        {
            self.title = @"隐私";
            return @[@{@"item": @[@{@"title":@"黑名单",@"class":@""},@{@"title":@"加我为好友时需要验证",@"switch":@""}]}];
            break;
        }
        case ZHSettingTypeNetTest:
        {
            self.title = @"网络检测";
            return @[@{@"item": @[@{@"title":@"网络链接",@"class":@""},@{@"title":@"百度IP解析",@"switch":@""},@{@"title":@"百度",@"switch":@""}]}];
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
    if (_sourceArr[section][@"head"]) {
        return @" ";
    } else {
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (_sourceArr[section][@"foot"]) {
        UILabel *footLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 270, 30)];
        [footLab setLabelStyleTextColor:[UIColor grayColor] fontSize:ZHSysFontSizeLarge];
        footLab.textAlignment = NSTextAlignmentCenter;
        footLab.numberOfLines = 0;
        footLab.lineBreakMode = NSLineBreakByWordWrapping;
        NSString *footStr = _sourceArr[section][@"foot"];
        CGSize strSize = [footStr sizeWithMaxWidth:footLab.width font:footLab.font];
        footLab.height = strSize.height + 30;
        footLab.text = footStr;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, footLab.height)];
        [view addSubview:footLab];
        view.backgroundColor = [UIColor lightGrayColor];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_sourceArr[section][@"foot"]) {
        NSString *footStr = _sourceArr[section][@"foot"];
        CGSize strSize = [footStr sizeWithMaxWidth:270 font:[UIFont systemFontOfSize:ZHSysFontSizeLarge]];
        return strSize.height + 30;
    }
    return 0;
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
