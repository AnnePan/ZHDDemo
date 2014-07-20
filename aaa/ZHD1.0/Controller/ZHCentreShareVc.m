//
//  ZHCentreShareVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHCentreShareVc.h"
#import "PJSegmentControl.h"
#import "ZHGoldFireView.h"

@interface ZHCentreShareVc ()
{
    NSMutableArray *_sourceArr;
    UIScrollView *_sourceScrollV;
}

@end

@implementation ZHCentreShareVc

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
    self.title = @"广场";
    
    NSArray *arr1 = @[@{@"key":@"最新分享",@"value":@(ZHCellTypeShare)},
                      @{@"key":@"最热分享",@"value":@(ZHCellTypeShare)}];
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
        ZHGoldFireView *detailTable = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(i * _sourceScrollV.width, 0, _sourceScrollV.width, _sourceScrollV.height)];
        [detailTable setSourceArray:_sourceArr fireType:[arr1[i][@"value"] intValue]];
        
        [_sourceScrollV addSubview:detailTable];
    }
}

- (void) changeContentWithIndex:(int)index
{
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}

@end
