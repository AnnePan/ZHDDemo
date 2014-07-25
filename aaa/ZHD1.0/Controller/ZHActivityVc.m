//
//  ZHActivityVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-16.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHActivityVc.h"
#import "PJSegmentControl.h"
#import "ZHCellTableManagerView.h"

@interface ZHActivityVc ()
{
    NSMutableArray *_sourceArr;
    UIScrollView *_sourceScrollV;
}

@end

@implementation ZHActivityVc

- (id)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}

- (void)requestData
{
    if (!_sourceArr) {
        _sourceArr = [[NSMutableArray alloc] init];
    }
    [_sourceArr addObjectsFromArray:@[@{},@{},@{}]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"活动";
    
    NSArray *arr1 = @[@{@"key":@"近期活动",@"value":@(ZHCellTypeActivity)},
                      @{@"key":@"活动回顾",@"value":@(ZHCellTypeActivity)}];
    NSMutableArray *keys = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in arr1) {
        [keys addObject:dic[@"key"]];
    }
    PJSegmentControl *scView = [[PJSegmentControl alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 35)];
    scView.sectionTitles = keys;
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
    
    _sourceScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, self.view.width, self.view.height - 150)];
    _sourceScrollV.contentSize = CGSizeMake(self.view.width * keys.count, self.view.height - 200);
    _sourceScrollV.pagingEnabled = YES;
    [self.view addSubview:_sourceScrollV];
    
    for (int i = 0; i < keys.count; i++) {
        ZHCellTableManagerView *detailTable = [[ZHCellTableManagerView alloc] initWithFrame:CGRectMake(i * _sourceScrollV.width, 0, _sourceScrollV.width, _sourceScrollV.height)];
        [detailTable setSourceArray:_sourceArr cellType:[arr1[i][@"value"] intValue] nextClass:nil];
        
        [_sourceScrollV addSubview:detailTable];
    }
}

- (void) changeContentWithIndex:(int)index
{
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}

@end
