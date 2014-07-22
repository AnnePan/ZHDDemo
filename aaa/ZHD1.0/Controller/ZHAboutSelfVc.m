//
//  ZHPersonInfoVc.m
//  ZHD
//
//  Created by 王 宝安 on 14-6-18.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "ZHAboutSelfVc.h"
#import "ZHReuseView.h"
#import "PJUserModel.h"
#import "ZHPersonCardVc.h"
#import "ZHLoginVc.h"

@interface ZHAboutSelfVc() <UITableViewDataSource, UITableViewDelegate>
{
    NSArray        *_sourceArr;
    UITableView    *_sourceTable;
    PJUserModel    *_user;
}

@end

@implementation ZHAboutSelfVc

- (id)init
{
    if (self = [super init]) {
        _user = [[PJUserModel alloc] init];
        _user.uName = @"潘娟娟";
        _user.uCompany = @"阿里巴巴深圳公司董事长";
        _user.uPicPath = @"all_group";
        _user.uIsVIP = YES;
        _sourceArr = @[@{@"image":@"i_share",@"title":@"个人名片",@"class":@"ZHPersonCardVc"},
                       @{@"image":@"i_share",@"title":@"我的分享"},
                       @{@"image":@"i_my_activity",@"title":@"参加过的活动"},
                       @{@"image":@"i_activity",@"title":@"我发起的活动"},
                       @{@"image":@"i_visitor",@"title":@"我的访客",@"class":@"ZHMyVisitorVc"},
                       @{@"image":@"i_more_bg",@"title":@"更多",@"class":@"ZHMoreVc"}];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    _sourceTable.layer.cornerRadius = 0;
    _sourceTable.tableFooterView = [UIView new];
    _sourceTable.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_sourceTable];
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 168)];
    view.image = [UIImage imageNamed:@"tempBg"];
    _sourceTable.tableHeaderView = view;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - 以下tableview的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor grayColor];
    }
    cell.imageView.image = [UIImage imageNamed:_sourceArr[indexPath.row][@"image"]];
    cell.textLabel.text = _sourceArr[indexPath.row][@"title"];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了 ＝＝＝ %d",indexPath.row);
    UIViewController *nextVc = [[NSClassFromString(_sourceArr[indexPath.row][@"class"]) alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
//    Class controllerName = NSClassFromString(_sourceArr[indexPath.row][@"class"]);
//    if (controllerName) {
//        UIViewController *viewController = [[controllerName alloc] init];
//        [self.navigationController pushViewController:viewController animated:YES];
//    }
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
/*
ZHPersonCardVc *pCard = [[ZHPersonCardVc alloc] initWithUserId:@"12345678"];
[self.navigationController pushViewController:pCard animated:YES];
 */
}
@end
