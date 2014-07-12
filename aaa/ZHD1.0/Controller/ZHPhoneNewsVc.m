//
//  ZHPhoneNewsVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHPhoneNewsVc.h"
#import "PJSegmentControl.h"
#import "PJWebView.h"
#import "ZHGoldFireView.h"

@interface ZHPhoneNewsVc ()
{
    UIScrollView *_sourceScrollV;
    NSMutableArray *_dataArr;
    NSString *_urlStr;
}

@end

@implementation ZHPhoneNewsVc

- (id)init
{
    if (self = [super init]) {
        _urlStr = @"http://www.qq.com";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self useiOS7BeforeStyle];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"正和岛手机报";
    
    PJSegmentControl *scView = [[PJSegmentControl alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 35)];
    scView.sectionTitles = @[@"每日推荐", @"往期回顾"];
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
    
    _sourceScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, self.view.width, self.view.height)];
    _sourceScrollV.contentSize = CGSizeMake(self.view.width *2, self.view.height);
    _sourceScrollV.pagingEnabled = YES;
    [self.view addSubview:_sourceScrollV];
    
    //每日推荐
    PJWebView *webView = [[PJWebView alloc] initWithFrame:CGRectMake(0, 0, _sourceScrollV.width, _sourceScrollV.height)];
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [webView loadWithUrl:_urlStr];
    [_sourceScrollV addSubview:webView];
    
    //往期回顾
    ZHGoldFireView *rightView = [[ZHGoldFireView alloc] initWithFrame:CGRectMake(self.view.width, 0, _sourceScrollV.width, _sourceScrollV.height)];
    [rightView setSourceArray:_dataArr fireType:ZHCellTypeDearAnswer];
    [_sourceScrollV addSubview:rightView];
}

- (void) changeContentWithIndex:(int)index
{
    [_sourceScrollV setContentOffset:CGPointMake(_sourceScrollV.width * index, 0)];
}

@end
