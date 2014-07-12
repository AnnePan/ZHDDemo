//
//  ZHEveryDayqVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHEveryDayqVc.h"
#import "ZHRequestAPI.h"
#import "PJSegmentControl.h"
#import "ZHGoldFireView.h"

@interface ZHEveryDayqVc ()
{
    UIScrollView *_sourceScrollV;
    NSMutableArray *_dataArr;
}

@end

@implementation ZHEveryDayqVc

- (id)init
{
    if (self = [super init]) {
        [self requestData];
    }
    return self;
}

- (void)requestData
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    [_dataArr addObjectsFromArray:[ZHRequestAPI requestEveryDayq]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"每日一问";
    
    PJSegmentControl *scView = [[PJSegmentControl alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 35)];
    scView.sectionTitles = @[@"按时间排序", @"按热门排序", @"热心岛邻"];
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
    _sourceScrollV.contentSize = CGSizeMake(self.view.width *2, self.view.height - 200);
    _sourceScrollV.pagingEnabled = YES;
    [self.view addSubview:_sourceScrollV];
    
    ZHGoldFireView *leftView = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(0, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [leftView setSourceArray:_dataArr fireType:ZHCellTypeQuestion];
    [_sourceScrollV addSubview:leftView];
    
    ZHGoldFireView *rightView = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(self.view.width, 0, _sourceScrollV.width, _sourceScrollV.height)];
    rightView.backgroundColor = [UIColor blueColor];
    [rightView setSourceArray:_dataArr fireType:ZHCellTypeQuestion];
    [_sourceScrollV addSubview:rightView];
}

- (void) changeContentWithIndex:(int)index
{
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}

@end
