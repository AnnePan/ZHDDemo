//
//  ZHGoldFireView.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-7.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHGoldFireView.h"
#import "PJAllFireCell.h"
#import "ZHGoldFireCell.h"

@interface ZHGoldFireView () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_sourceTable;
    NSArray *_sourceArr;
    
    ZHFireType _fireType;
}

@end
@implementation ZHGoldFireView

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

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_fireType == ZHFireTypeAll) {
        PJAllFireCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
        [cell setItem:_sourceArr[indexPath.row]];
        return cell;
    } else if (_fireType == ZHFireTypeGold) {
        ZHGoldFireCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
        [cell setItem:_sourceArr[indexPath.row]];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _fireType == ZHFireTypeAll ? 70 : 90;
}

- (void)setSourceArray:(NSArray *)sourceArray fireType:(ZHFireType)fireType
{
    _fireType = fireType;
    if (_fireType == ZHFireTypeGold) {
        [_sourceTable registerClass:[ZHGoldFireCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    } else {
        [_sourceTable registerClass:[PJAllFireCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
    }
    _sourceArr = sourceArray;
    [_sourceTable reloadData];
}
@end
