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
    for (int i = 0 ; i < 10; i++) {
        PJUserModel *user = [[PJUserModel alloc] init];
        user.uPicPath = @"all_group";
        user.uName = [NSString stringWithFormat:@"戴云峰%d",i];
        user.uFires = @[@"",@"",@""];
        [_rightArr addObject:user];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
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
    
    _sourceScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, self.view.width, self.view.height - 150)];
    _sourceScrollV.contentSize = CGSizeMake(self.view.width *2, self.view.height - 200);
    _sourceScrollV.pagingEnabled = YES;
    [self.view addSubview:_sourceScrollV];
    
    ZHGoldFireView *leftView = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(0, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [leftView setSourceArray:_rightArr fireType:ZHFireTypeGold];
    [_sourceScrollV addSubview:leftView];
    
    ZHGoldFireView *rightView = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(self.view.width, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [rightView setSourceArray:_rightArr fireType:ZHFireTypeAll];
    [_sourceScrollV addSubview:rightView];
    
}

- (void) changeContentWithIndex:(int)index
{
//    _sourceScrollV.contentOffset.x = index * _sourceScrollV.width;
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}
@end
