//
//  ZHRootVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-21.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHRootVc.h"
#import "ZHHomePageVc.h"
#import "ZHContactsVc.h"
#import "ZHAboutSelfVc.h"
#import "ZHPersonSettingVc.h"

@interface ZHRootVc ()
{
    UIButton *oldBtn;
    NSArray *bgImageArr, *hlImageArr;
}

@end

@implementation ZHRootVc

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _initSubViewController];
    [self _initTabBar];
}

- (void)_initSubViewController
{
    ZHHomePageVc *homeView = [[ZHHomePageVc alloc] init];
    ZHContactsVc *contactsView = [[ZHContactsVc alloc] init];
    ZHAboutSelfVc *aboutSelfView = [[ZHAboutSelfVc alloc] init];
    ZHPersonSettingVc *personSetView = [[ZHPersonSettingVc alloc] init];
    
    NSArray *viewArr = @[homeView, contactsView, aboutSelfView, personSetView];
    NSMutableArray *itemNvcArr = [NSMutableArray arrayWithCapacity:4];
    
    for (int i = 0; i < viewArr.count; i++) {
        UINavigationController *itemNvc = [[UINavigationController alloc] initWithRootViewController:viewArr[i]];
        [itemNvcArr addObject:itemNvc];
    }
    self.viewControllers = itemNvcArr;
}

- (void)_initTabBar
{
    self.tabBar.hidden = YES;
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 55, SCREEN_WIDTH, 55)];
    [self.view addSubview:_tabBarView];
    _tabBarView.backgroundColor = [UIColor blackColor];
    
    bgImageArr = @[@"home_item_home",@"home_item_contact",@"home_item_profile",@"home_item_action"];
    hlImageArr = @[@"home_item_home_focus",@"home_item_contact_focus",@"home_item_profile_focus",@"home_item_action_focus"];
    
    for (int i = 0; i < bgImageArr.count; i++) {
        UIButton *itemBg = [[UIButton alloc] initWithFrame:CGRectMake(i * (SCREEN_WIDTH / 4.0), 0, SCREEN_WIDTH / 4.0, _tabBarView.height)];
        UIButton *itemImg = [[UIButton alloc] initWithFrame:CGRectMake((itemBg.width - itemBg.height)/2, 0, itemBg.height, itemBg.height)];
        itemImg.tag = i;
        [itemImg setBackgroundImage:[UIImage imageNamed:bgImageArr[i]] forState:UIControlStateNormal];
        [itemImg setBackgroundImage:[UIImage imageNamed:hlImageArr[i]] forState:UIControlStateHighlighted];
        [itemImg addTarget:self action:@selector(tabBarItemChange:) forControlEvents:UIControlEventTouchUpInside];
        [itemBg addSubview:itemImg];
        [_tabBarView addSubview:itemBg];
        
        if (i == 0) {
            [itemImg setBackgroundImage:[UIImage imageNamed:hlImageArr[i]] forState:UIControlStateNormal];
            oldBtn = itemImg;
        }
    }
}

- (void)tabBarItemChange:(UIButton *)btn
{
    

    if (oldBtn.tag != btn.tag) {
        [oldBtn setBackgroundImage:[UIImage imageNamed:bgImageArr[oldBtn.tag]] forState:UIControlStateNormal];
    }
    [btn setBackgroundImage:[UIImage imageNamed:hlImageArr[btn.tag]] forState:UIControlStateNormal];
    oldBtn = btn;
    self.selectedIndex = btn.tag;
}

@end
