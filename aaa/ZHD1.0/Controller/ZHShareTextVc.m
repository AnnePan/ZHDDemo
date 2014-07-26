//
//  ZHShareTextVc.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-26.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHShareTextVc.h"
#import "PJQuestionModel.h"
#import "NSString+Additions.h"

@interface ZHShareTextVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
    PJQuestionModel *_forwordQuse;
}

@end

@implementation ZHShareTextVc

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (id)initWithQues:(PJQuestionModel *)ques
{
    if (self = [super init]) {
        _forwordQuse = ques;
        _sourceArr = _forwordQuse.qTransfers;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"分享正文";
    self.view.backgroundColor = [UIColor redColor];
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    _sourceTable.dataSource = self;
    _sourceTable.delegate = self;
    _sourceTable.tableFooterView = [UIView new];
    [self.view addSubview:_sourceTable];
    
//    _sourceTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    [self initTableHeaderView];
}

- (void)initTableHeaderView
{
    NSString *titleStr = _forwordQuse.qTitle;
    CGSize titleSize = [titleStr sizeWithMaxWidth:(self.view.width - (ZHSysSpaceLarge * 2)) font:[UIFont boldSystemFontOfSize:ZHSysFontSizeDefault]];
    NSString *textStr = _forwordQuse.qText;
    CGSize textSize = [textStr sizeWithMaxWidth:(self.view.width - (ZHSysSpaceLarge * 2)) font:[UIFont boldSystemFontOfSize:ZHSysFontSizeDefault]];
    
    UILabel *titlelab = [[UILabel alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, ZHSysSpaceMiddle, titleSize.width, titleSize.height)];
    titlelab.text = titleStr;
    titlelab.font = [UIFont boldSystemFontOfSize:ZHSysFontSizeDefault];
    titlelab.numberOfLines = 0;
    titlelab.lineBreakMode = NSLineBreakByWordWrapping;
    
    UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(ZHSysSpaceLarge, titlelab.height + ZHSysSpaceMiddle, textSize.width, textSize.height)];
    textLab.text = textStr;
    textLab.font = [UIFont systemFontOfSize:ZHSysFontSizeDefault];
    textLab.numberOfLines = 0;
    textLab.lineBreakMode = NSLineBreakByWordWrapping;
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, titlelab.height + textLab.height + (ZHSysSpaceMiddle * 4))];
    headerV.backgroundColor = [UIColor redColor];
    [headerV addSubview:titlelab];
    [headerV addSubview:textLab];
    
    _sourceTable.tableHeaderView = headerV;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
    }
    cell.textLabel.text = @"12345";
    return cell;
}

@end
