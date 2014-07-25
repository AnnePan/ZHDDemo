//
//  ZHGoldFireView.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-7.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHCellTableManagerView.h"
#import "PJUserModel.h"
#import "PJAllFireCell.h"
#import "ZHGoldFireCell.h"
#import "ZHQuestionCell.h"
#import "PJDearNeighbourCell.h"
#import "PJOldNewsCell.h"
#import "ZHClanActivityCell.h"
#import "PJInformationCell.h"
#import "ZHShareCell.h"

#import "ZHRecommendDetailVc.h"

#import "NSString+Additions.h"

@interface ZHCellTableManagerView () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_sourceTable;
    NSArray *_sourceArr;
    
    ZHCellType _cellType;
    NSString *_nextClass;
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



- (void)setSourceArray:(NSArray *)sourceArray cellType:(ZHCellType)cellType nextClass:(NSString *)next
{
    _cellType = cellType;
    _nextClass = next;
    NSClassFromString(@"");
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
        case ZHCellTypeDearAnswer:
        {
            [_sourceTable registerClass:[PJDearNeighbourCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
        case ZHCellTypeNews:
        {
            [_sourceTable registerClass:[PJOldNewsCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
        case ZHCellTypeActivity:
        {
            [_sourceTable registerClass:[ZHClanActivityCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
        case ZHCellTypeInformation:
        {
            [_sourceTable registerClass:[PJInformationCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
        case ZHCellTypeShare:
        {
            [_sourceTable registerClass:[ZHShareCell class] forCellReuseIdentifier:NSStringFromClass(self.class)];
            break;
        }
            
        default:
            break;
    }
    _sourceArr = sourceArray;
    [_sourceTable reloadData];
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
        case ZHCellTypeDearAnswer:
        {
            PJDearNeighbourCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
            [cell setItem:_sourceArr[indexPath.row]];
            return cell;
            break;
        }
        case ZHCellTypeNews:
        {
            PJOldNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
            [cell setItem:_sourceArr[indexPath.row]];
            return cell;
            break;
        }
        case ZHCellTypeActivity:
        {
            ZHClanActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
            [cell setItem:_sourceArr[indexPath.row]];
            return cell;
            break;
        }
        case ZHCellTypeInformation:
        {
            PJInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
            [cell setItem:_sourceArr[indexPath.row]];
            return cell;
            break;
        }
        case ZHCellTypeShare:
        {
            ZHShareCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
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
        case ZHCellTypeGoldFire:
        {
            PJUserModel *user = _sourceArr[indexPath.row];
            CGFloat height = 90 + [user.uFireDirections sizeWithMaxWidth:270 font:[UIFont systemFontOfSize:14]].height;
            return MIN(height, 150);
            break;
        }
        case ZHCellTypeActivity:
            return 220;
            
        case ZHCellTypeShare:
            return 180;
            
        case ZHCellTypeDearAnswer:
        case ZHCellTypeNews:
        case ZHCellTypeAllFire:
            return 70;
            
        case ZHCellTypeQuestion:
        case ZHCellTypeInformation:
            return 90;
            
        default:
            break;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_cellType) {
        case ZHCellTypeGoldFire:
        {
            ZHRecommendDetailVc *nextVc = [[ZHRecommendDetailVc alloc] init];
            [self.viewController.navigationController pushViewController:nextVc animated:YES];
            break;
        }
        case ZHCellTypeActivity:
        {
            break;
        }
            
        case ZHCellTypeShare:
        {
            break;
        }
            
        case ZHCellTypeDearAnswer:
        {
            break;
        }
        case ZHCellTypeNews:
        {
            break;
        }
        case ZHCellTypeAllFire:
        {
            ZHRecommendDetailVc *nextVc = [[ZHRecommendDetailVc alloc] init];
            [self.viewController.navigationController pushViewController:nextVc animated:YES];
            break;
        }
            
        case ZHCellTypeQuestion:
        {
            break;
        }
        case ZHCellTypeInformation:
        {
            break;
        }
            
        default:
            break;
    }
    
}
@end
