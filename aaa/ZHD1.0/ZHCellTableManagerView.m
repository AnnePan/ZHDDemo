//
//  ZHCellTableManagerView.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-24.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHCellTableManagerView.h"

@interface ZHCellTableManagerView () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_sourceTable;
    NSArray *_sourceArr;
    NSString *_cellClass;
}

@end


@implementation ZHCellTableManagerView

- (id)initWithFrame:(CGRect)frame;
{
    if (self = [super initWithFrame:frame]) {
        _sourceTable = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _sourceTable.delegate = self;
        _sourceTable.dataSource = self;
        [self addSubview:_sourceTable];
    }
    return self;
}

- (void)setSourceArray:(NSArray *)sourceArray cellClass:(NSString *)cellStr
{
    _cellClass = cellStr;
}

#pragma makr - UITableViewDelegate, UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
    }
    return cell;
}
@end
