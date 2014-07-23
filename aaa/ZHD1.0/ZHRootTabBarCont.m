//
//  ZHRootTabBarCont.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-21.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHRootTabBarCont.h"
#import "ZHHomePageVc.h"
#import "ZHContactsVc.h"
#import "ZHAboutSelfVc.h"
#import "ZHPersonSettingVc.h"

@interface ZHRootTabBarCont ()

@end

@implementation ZHRootTabBarCont

- (id)init
{
    if (self = [super init]) {
        self.tabBar.tintColor = [UIColor orangeColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _initSubViewController];
}

- (void)_initSubViewController
{
    ZHHomePageVc *homeView = [[ZHHomePageVc alloc] init];
    ZHContactsVc *contactsView = [[ZHContactsVc alloc] init];
    ZHAboutSelfVc *aboutSelfView = [[ZHAboutSelfVc alloc] init];
    ZHPersonSettingVc *personSetView = [[ZHPersonSettingVc alloc] init];
    
    NSArray *itemArr = @[@{@"view":homeView,@"image":@"home_tab_home",@"title":@"首页"},
                         @{@"view":contactsView,@"image":@"home_tab_contact",@"title":@"通讯录"},
                         @{@"view":aboutSelfView,@"image":@"home_tab_profile",@"title":@"我"},
                         @{@"view":personSetView,@"image":@"home_tab_action",@"title":@"设置"}];
    NSMutableArray *itemNvcArr = [NSMutableArray arrayWithCapacity:4];
    
    for (int i = 0; i < itemArr.count; i++) {
        UINavigationController *itemNvc = [[UINavigationController alloc] initWithRootViewController:itemArr[i][@"view"]];
        itemNvc.tabBarItem.image = [UIImage imageNamed:itemArr[i][@"image"]];
        itemNvc.tabBarItem.title = itemArr[i][@"title"];
        [itemNvcArr addObject:itemNvc];
    }
    self.viewControllers = itemNvcArr;
}

@end
