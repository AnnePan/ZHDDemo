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
#import "ZHCellTableManagerView.h"

@interface ZHEveryDayqVc ()
{
    UIScrollView *_sourceScrollV;
    NSMutableArray *_questionArr;
    NSMutableArray *_dearAnswerArr;
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
    if (!_questionArr) {
        _questionArr = [[NSMutableArray alloc] init];
    }
    [_questionArr addObjectsFromArray:[ZHRequestAPI requestEveryDayq]];
    if (!_dearAnswerArr) {
        _dearAnswerArr = [[NSMutableArray alloc] init];
    }
    [_dearAnswerArr addObjectsFromArray:[ZHRequestAPI requestContacts]];
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
    _sourceScrollV.contentSize = CGSizeMake(self.view.width *3, self.view.height - 200);
    _sourceScrollV.pagingEnabled = YES;
    [self.view addSubview:_sourceScrollV];
    
    //按时间排序
    ZHCellTableManagerView *leftView = [[ZHCellTableManagerView alloc] initWithFrame:CGRectMake(0, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [leftView setSourceArray:_questionArr cellType:ZHCellTypeQuestion nextClass:nil];
    [_sourceScrollV addSubview:leftView];
    
    //按热门排序
    ZHCellTableManagerView *middleView = [[ZHCellTableManagerView alloc] initWithFrame:CGRectMake(self.view.width, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [middleView setSourceArray:_questionArr cellType:ZHCellTypeQuestion nextClass:nil];
    [_sourceScrollV addSubview:middleView];
    
    //热心岛邻
    ZHCellTableManagerView *rightView = [[ZHCellTableManagerView alloc] initWithFrame:CGRectMake(self.view.width * 2, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [rightView setSourceArray:_dearAnswerArr cellType:ZHCellTypeDearAnswer nextClass:nil];
    [_sourceScrollV addSubview:rightView];
}

- (void) changeContentWithIndex:(int)index
{
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}

@end
