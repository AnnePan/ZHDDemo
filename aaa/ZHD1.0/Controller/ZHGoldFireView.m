//
//  ZHGoldFireView.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-7.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHGoldFireView.h"
#import "PJUserModel.h"
#import "PJAllFireCell.h"
#import "ZHGoldFireCell.h"
#import "ZHQuestionCell.h"

#import "NSString+Additions.h"

@interface ZHGoldFireView () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_sourceTable;
    NSArray *_sourceArr;
    
    ZHCellType _cellType;
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
    switch (_cellType) {
        case ZHCellTypeAllFire:
        {
            PJAllFireCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
            [cell setItem:_sourceArr[indexPath.row]];
            return cell;
            break;
        }
        case ZHCellTypeGoldFire:
        {
            ZHGoldFireCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
            [cell setItem:_sourceArr[indexPath.row]];
            return cell;
            break;
        }
        case ZHCellTypeQuestion:
        {
            ZHQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
            [cell setItem:_sourceArr[indexPath.row]];
            return cell;
            break;
        }
            
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_cellType) {
        case ZHCellTypeAllFire:
        {
            return 70;
            break;
        }
        case ZHCellTypeGoldFire:
        {
            PJUserModel *user = _sourceArr[indexPath.row];
            return  90 + [user.uFireDirections sizeWithMaxWidth:270 font:[UIFont systemFontOfSize:14]].height;
            break;
        }
        case ZHCellTypeQuestion:
        {
            return 90;
            break;
        }
            
        default:
            break;
    }
    return 0;
}

- (void)setSourceArray:(NSArray *)sourceArray fireType:(ZHCellType)cellType
{
    _cellType = cellType;
    switch (_cellType) {
        case ZHCellTypeAllFire:
        {
            [_sourceTable registerClass:[PJAllFireCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
        case ZHCellTypeGoldFire:
        {
            [_sourceTable registerClass:[ZHGoldFireCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
        case ZHCellTypeQuestion:
        {
            [_sourceTable registerClass:[ZHQuestionCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
            
        default:
            break;
    }
    _sourceArr = sourceArray;
    [_sourceTable reloadData];
}
@end
