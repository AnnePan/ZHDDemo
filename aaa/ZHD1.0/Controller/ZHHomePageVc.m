//
//  ZHHomePageVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-6-30.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHHomePageVc.h"
#import "PACycleScrollView.h"

#define INTRODUCELABLE_WIGHT 30.     //说明lable 的高度
#define INTRODUCELABLE_Y 15.         //说明lable 距离下边距的 Y
#define INTRODUCELABLEFONT_SIZE 14.  //lable 的字体大小
#define kSCROLLVIEW_HEIGHT 225.  //lable 的字体大小

@interface ZHHomePageVc () <CycleScrollViewDataSource,CycleScrollViewDelegate>
{
    NSArray *_optionsNameArray;
    UIScrollView *_backView;
    
    //以下属性是动画效果相关
    PACycleScrollView *_topScorllView;
    NSArray *_topScorllImageArr;
    NSInteger _number;
}
@end

@implementation ZHHomePageVc

- (id)init
{
    if (self = [super init]) {
        _topScorllImageArr = @[@"tempBg",@"homePage01",@"homePage02",@"homePage03"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initBodyView];
    [self initScorlleView];
}

#pragma mark - 进入页面开始滚动  退出页面停止滚动
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [_topScorllView autoScrollStart];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [_topScorllView autoScrollStop];
}
- (void)initBodyView
{
    _optionsNameArray = @[@{@"text":@"部落圈子",@"class":@"ZHClanVc",@"title":@"部落",@"image":@"home_tab_rouund"},
                          @{@"text":@"最新资讯",@"class":@"ZHInformationVc",@"title":@"最新资讯111",@"image":@"home_tab_news"},
                          @{@"text":@"岛上活动",@"class":@"ZHActivityVc",@"title":@"在线购卡",@"image":@"home_tab_games"},
                          @{@"text":@"广场分享",@"class":@"ZHCentreShareVc",@"title":@"广场活动",@"image":@"home_tab_share"},
                          @{@"text":@"每日一问",@"class":@"ZHEveryDayqVc",@"title":@"每日一问",@"image":@"home_tab_ask"},
                          @{@"text":@"手机报",@"class":@"ZHPhoneNewsVc",@"title":@"手机报",@"image":@"home_mobile_news"},
                          @{@"text":@"金火种",@"class":@"ZHGoldFireVc",@"title":@"金火种",@"image":@"home_tab_fire"},
                          @{@"text":@"岛上找人",@"class":@"ZHFindVc",@"title":@"岛上找人",@"image":@"home_tab_search"}];
    CGFloat subViewW = 107.;
    CGFloat subViewH = 95.;
    _backView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    _backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_backView];
    
    // 列表布局
    for(int i = 0;i < _optionsNameArray.count; i ++)
    {
        UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(i % 3 * subViewW + 1, (kSCROLLVIEW_HEIGHT + (i / 3 * subViewH + 1)), subViewW - 1 - ( i % 3 ? 1 : 0), subViewH - 1)];
        (i % 3 == 2) ? [subView setLeft:subView.left - 1] : 1;
        subView.backgroundColor = [UIColor lightGrayColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:subView.bounds];
        imageView.image = [UIImage imageNamed:[[_optionsNameArray objectAtIndex:i] objectForKey:@"image"]];
        [subView addSubview:imageView];
        
        UILabel *introduceLable = [[UILabel alloc]initWithFrame:CGRectMake(0, subViewH - INTRODUCELABLE_WIGHT - INTRODUCELABLE_Y, subViewW, INTRODUCELABLE_WIGHT)];
        [self setLableProperty:introduceLable];
        introduceLable.text = [[_optionsNameArray objectAtIndex:i] objectForKey:@"text"];
        introduceLable.tag = i + 10;
        [subView addSubview:introduceLable];
        
        UIButton *tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tapButton.frame = subView.bounds;
        tapButton.tag = i;
        [tapButton addTarget:self action:@selector(tapButtonClock:) forControlEvents:UIControlEventTouchUpInside];
        [subView addSubview:tapButton];
        [_backView addSubview:subView];
    }
    _backView.contentSize=CGSizeMake(self.view.width, kSCROLLVIEW_HEIGHT + (95 * 3));
}

- (void)initScorlleView
{
    _number = 0;
    
    _topScorllView = [[PACycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kSCROLLVIEW_HEIGHT)];
    _topScorllView.delegate = self;
    _topScorllView.dataSource = self;
    _topScorllView.animationDuration = 2;
    _topScorllView.backgroundColor = [UIColor clearColor];
    [_backView addSubview:_topScorllView];
    [_topScorllView reloadData];
}

- (void)setLableProperty:(UILabel *)lable
{
    lable.backgroundColor = [UIColor clearColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:INTRODUCELABLEFONT_SIZE];
    lable.textColor = [UIColor colorWithRGB:0x8c8c8c];
}

- (void)tapButtonClock:(UIButton *)button
{
    UIViewController *nextVc = [[NSClassFromString(_optionsNameArray[button.tag][@"class"]) alloc]init];
    nextVc.title = [[_optionsNameArray objectAtIndex:button.tag] objectForKey:@"title"];
    [self.navigationController pushViewController:nextVc animated:YES];
    NSLog(@"class == %@",_optionsNameArray[button.tag][@"class"]);
}

#pragma mark - CycleScrollViewDelegate
- (UIView *)cycleScrollView:(PACycleScrollView *)cycleScrollView
{
    NSLog(@"要页面初始化");
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _topScorllView.width, _topScorllView.height)];
//    lable.backgroundColor = [UIColor whiteColor];
//    lable.text = @"滚动视图";
//    lable.textColor = [UIColor whiteColor];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _topScorllView.width, _topScorllView.height)];
    imgV.image = [UIImage imageNamed:@"tempBg"];
    
    return imgV;
}

- (UIView *)cycleScrollView:(PACycleScrollView *)cycleScrollView setDataForView:(UIView *)view forIndexPath:(NSInteger)index
{
    NSLog(@"加载页面数据");
    UIImageView *imgV = (UIImageView *)view;
    imgV.image = [UIImage imageNamed:_topScorllImageArr[index]];
    return view;
}

- (NSUInteger)numberOfCycleScrollView:(PACycleScrollView *)cycleScrollView
{
    return _topScorllImageArr.count;
}
- (void)cycleScrollView:(PACycleScrollView *)cycleScrollView viewAtIndex:(NSInteger)index
{
    NSLog(@"当前视图所在的位置 : %d",index);
}

- (void)cycleScrollView:(PACycleScrollView *)cycleScrollView didCycleScrollViewAtIndex:(NSInteger)index
{
    if(_number++ % 2){
        [_topScorllView autoScrollStart];
    } else {
        [_topScorllView autoScrollStop];
    }
    NSLog(@"点击第几个视图 : %d",index);
}



@end
