//
//  ZHPersonCardVc.m
//  ZHD
//
//  Created by Anne Pan on 14-6-21.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "ZHPersonCardVc.h"
#import "PJUserModel.h"
#import "ZHReuseView.h"
#import "UIButton+ZHDsytle.h"
#import "PJSegmentControl.h"
#import "PJCardUpdataVc.h"

@interface ZHPersonCardVc ()
{
    UIScrollView *_contentScrV;
    PJUserModel *_user;
    
    UIView *_v0,*_v1,*_v2;
    UIView *_contentView;
}

@end

@implementation ZHPersonCardVc
#pragma requestData
- (void)requestDataByUserId:(NSString *)userId
{
    _user = [[PJUserModel alloc] init];
    _user.uId = @"88888888";
    _user.uName = @"侯红亮";
    _user.uCompany = @"深圳市鼎芯无限科技有限公司董事长";
    _user.uIsVIP = YES;
    _user.uPeapleColor = @[@"v_green",@"v_blue",@"v_green"];
    _user.uPicPath = @"all_group";
    _user.uTelphone = 13812341234;
    _user.uWeChatNum = @"uk86-icitu";
    _user.uEmail = @"test@163.com";
    _user.uRecommender = @"赵本山";
}

- (id)init
{
    if (self = [super init]) {
        [self requestDataByUserId:@"12"];
    }
    return self;
}

- (id)initWithUserId:(NSString *)userId;
{
    if (self = [super init]) {
        [self requestDataByUserId:userId];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"个人名片";
    
    _contentScrV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    _contentScrV.backgroundColor = [UIColor redColor];
    _contentScrV.contentSize = CGSizeMake(self.view.width, self.view.height);
    [self.view addSubview:_contentScrV];
    
    //用户信息
    ZHReuseView *uInfoV = [[ZHReuseView alloc] initUser2WithFrame:CGRectMake(0, 0, self.view.width, 110) user:_user];
    [_contentScrV addSubview:uInfoV];
    
    UIView *buttonV = [[UIView alloc] initWithFrame:CGRectMake(0, uInfoV.bottom, self.view.width, 80)];
    buttonV.backgroundColor = [UIColor whiteColor];
    [_contentScrV addSubview:buttonV];
    
    //编辑信息／加好友／聊天
    UIButton *leftBT = nil;
    if (_user.uId) {//****此处判断应为请求ID与本地ID是否相同
        leftBT = [[UIButton alloc] initPcardBTFrame:CGRectMake(20, 15, (buttonV.width - 60)/2, buttonV.height - 30) title:@"编辑资料" imageBg:@"btn_group_bg"];
        leftBT.tag = 100;
    } else {
        leftBT = [[UIButton alloc] initPcardBTFrame:CGRectMake(20, 15, (buttonV.width - 60)/2, buttonV.height - 30) title:@"加好友" imageBg:@"btn_group_bg"];
        leftBT.tag = 101;
    }
    [leftBT addTarget:self action:@selector(eventTouch:) forControlEvents:UIControlEventTouchUpInside];
    [buttonV addSubview:leftBT];
    
    UIButton *rightBT = [[UIButton alloc] initPcardBTFrame:leftBT.frame title:@"转发名片" imageBg:@"blue_send_btn_bg"];
    rightBT.left = leftBT.right + 20;
    rightBT.tag = 104;
    [leftBT addTarget:self action:@selector(eventTouch:) forControlEvents:UIControlEventTouchUpInside];
    [buttonV addSubview:rightBT];
    
    //联络方式
    ZHReuseView *contactV = [[ZHReuseView alloc] initContactVWithFrame:CGRectMake(0, buttonV.bottom, self.view.width, 100) user:_user];
    contactV.backgroundColor = [UIColor whiteColor];
    [_contentScrV addSubview:contactV];
    
    PJSegmentControl *scView = [[PJSegmentControl alloc] initWithFrame:CGRectMake(0, contactV.bottom, self.view.width, 45)];
    scView.sectionTitles = @[@"商业信息", @"个人信息", @"个人动态"];
    [scView setSelectionIndicatorHeight:3.0f];
    [scView setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:15]];
    [scView setTextColor:[UIColor greenColor]];
    [scView setSelectionIndicatorColor:[UIColor greenColor]];
    [scView setSelectionIndicatorMode:HMSelectionIndicatorResizesToStringWidthBottom];
    [scView setIndexChangeBlock:^(NSUInteger index) {
        [self changeContentWithIndex:index];
    }];
    [_contentScrV addSubview:scView];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, scView.bottom, self.view.width, 0)];
    [_contentScrV addSubview:_contentView];
    
    scView.selectedIndex = 0;
    [self changeContentWithIndex:0];
    
//    _contentScrV.contentSize.height = 600;
}

- (void)changeContentWithIndex:(NSInteger)index
{
    _v0.hidden = _v1.hidden = _v2.hidden = YES;
    switch (index) {
        case 0:
        {
//            _contentScrV.contentSize = CGSizeMake(self.view.width, self.view.height+[_contentView getgerenheight]);
            if (!_v0) {
                _v0 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
                _v0.backgroundColor = [UIColor redColor];
                [_contentView addSubview:_v0];
                
            } else {
                _v0.hidden = NO;
            }
            break;
        }case 1:
        {
            _contentScrV.contentSize = CGSizeMake(self.view.width, self.view.height-300);
            if (!_v1) {
                _v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
                _v1.backgroundColor = [UIColor grayColor];
                [_contentView addSubview:_v1];
            } else {
                _v1.hidden = NO;
            }
            break;
        }case 2:
        {
            _contentScrV.contentSize = CGSizeMake(self.view.width, self.view.height+500);
            if (!_v2) {
                _v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
                _v2.backgroundColor = [UIColor brownColor];
                [_contentView addSubview:_v2];
            } else {
                _v2.hidden = NO;
            }
            break;
        }
        default:
            break;
    }
    
}

#pragma mark - Action
- (void)eventTouch:(UIButton *)btn
{
    switch (btn.tag) {
        case 100:
        {
            NSLog(@"编辑资料");
            PJCardUpdataVc *nextVc = [[PJCardUpdataVc alloc] init];
            [self.navigationController pushViewController:nextVc animated:YES];
            break;
        }
        case 101:
            NSLog(@"加好友");
            break;
        case 102:
            NSLog(@"聊天");
            break;
        case 103:
            NSLog(@"转发名片");
            break;
            
        default:
            break;
    }
}


@end
