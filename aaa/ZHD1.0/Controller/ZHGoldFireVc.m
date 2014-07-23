//
//  ZHGoldFireVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-7.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHGoldFireVc.h"
#import "PJSegmentControl.h"
#import "ZHGoldFireView.h"
#import "PJUserModel.h"

#import "ZHRequestAPI.h"

@interface ZHGoldFireVc ()
{
    UIScrollView *_sourceScrollV;
    
    NSMutableArray *_rightArr;
}

@end

@implementation ZHGoldFireVc

- (id)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}

- (void)requestData
{
    if (!_rightArr) {
        _rightArr = [[NSMutableArray alloc] init];
    }
    [_rightArr addObjectsFromArray:[ZHRequestAPI requestContacts]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"金火种";
    
    PJSegmentControl *scView = [[PJSegmentControl alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 35)];
    scView.sectionTitles = @[@"金火种", @"全部火种"];
    [scView setSelectionIndicatorHeight:3.0f];
    [scView setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:15]];
    [scView setTextColor:[UIColor greenColor]];
    [scView setSelectionIndicatorColor:[UIColor greenColor]];
    [scView setSelectionIndicatorMode:HMSelectionIndicatorResizesToStringWidthBottom];
    [scView setIndexChangeBlock:^(NSUInteger index) {
        [self changeContentWithIndex:(int)index];
        NSLog(@"index == %d",(int)index);
    }];
    scView.selectedIndex = 0;
    [self.view addSubview:scView];
    
    _sourceScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, scView.height, self.view.width, self.view.height - 150)];
    _sourceScrollV.contentSize = CGSizeMake(_sourceScrollV.width *2, _sourceScrollV.height);
    _sourceScrollV.directionalLockEnabled = YES;
    _sourceScrollV.pagingEnabled = YES;
    _sourceScrollV.backgroundColor = [UIColor redColor];
    [self.view addSubview:_sourceScrollV];
    
    ZHGoldFireView *leftView = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(0, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [leftView setSourceArray:_rightArr fireType:ZHCellTypeGoldFire];
    [_sourceScrollV addSubview:leftView];
    
    ZHGoldFireView *rightView = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(self.view.width, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [rightView setSourceArray:_rightArr fireType:ZHCellTypeAllFire];
    [_sourceScrollV addSubview:rightView];
    
}

- (void) changeContentWithIndex:(int)index
{
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}
@end
