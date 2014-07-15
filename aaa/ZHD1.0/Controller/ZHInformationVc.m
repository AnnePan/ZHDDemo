//
//  ZHInformationVc.m
//  ZHD1.0
//
//  Created by hamigua on 14-7-15.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHInformationVc.h"
#import "ZHGoldFireView.h"
#import "PJSegmentControl.h"

@interface ZHInformationVc ()
{
    NSArray *_arr1;
    
    UIScrollView *_sourceScrollV;
    NSArray *_sourceArr;
}

@end

@implementation ZHInformationVc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self requestData];
    }
    return self;
}

- (void)requestData
{
    _arr1 = @[@{@"key":@"最新",@"value":@(ZHCellTypeInformation)},
           @{@"key":@"独家",@"value":@(ZHCellTypeInformation)},
           @{@"key":@"头条",@"value":@(ZHCellTypeInformation)},
           @{@"key":@"岛邻正在读",@"value":@(ZHCellTypeInformation)}];
    if (!_sourceArr) {
        _sourceArr = [[NSMutableArray alloc] init];
    }
    _sourceArr = @[@{},@{},@{}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"最新资讯";
    
    NSMutableArray *keys = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in _arr1) {
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
        [detailTable setSourceArray:_sourceArr fireType:[_arr1[i][@"value"] intValue]];
        
        [_sourceScrollV addSubview:detailTable];
    }
    
}

- (void) changeContentWithIndex:(int)index
{
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}

@end
