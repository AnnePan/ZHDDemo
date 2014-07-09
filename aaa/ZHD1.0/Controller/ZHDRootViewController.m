//
//  ZHDRootViewController.m
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//
#define SELECTED_VIEW_CONTROLLER_TAG 98456345
#define NOTIFICATION_IMAGE_VIEW_TAG 98456346

#import "ZHDRootViewController.h"

#import "ZHHomePageVc.h"
#import "ZHContactsVc.h"
#import "ZHAboutSelfVc.h"
#import "ZHPersonSettingVc.h"

@interface ZHDRootViewController () <UITabBarControllerDelegate> {
    UITabBarController *_tabbar;
}

@end

@implementation ZHDRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置4个不同的tab，对应4个不同的页面
	ZHHomePageVc *homePageVc = [[ZHHomePageVc alloc] init];
    UINavigationController *homePageNvc = [[UINavigationController alloc] initWithRootViewController:homePageVc];
    homePageNvc.tabBarItem.image = [UIImage imageNamed:@"home_tab_home"];
    homePageNvc.tabBarItem.title = @"首页";
    
	ZHContactsVc *vctwo = [[ZHContactsVc alloc] init];
    vctwo.tabBarItem.image = [UIImage imageNamed:@"home_tab_contact"];
    vctwo.tabBarItem.title = @"通讯录";
    
	ZHAboutSelfVc *vcthree = [[ZHAboutSelfVc alloc] init];
    UINavigationController *nvcThree = [[UINavigationController alloc] initWithRootViewController:vcthree];
    nvcThree.tabBarItem.image = [UIImage imageNamed:@"home_tab_profile"];
    nvcThree.tabBarItem.title = @"我";
    
    ZHPersonSettingVc *vcfour = [[ZHPersonSettingVc alloc] init];
    UINavigationController *nvcFour = [[UINavigationController alloc] initWithRootViewController:vcfour];
    nvcFour.tabBarItem.image = [UIImage imageNamed:@"home_tab_action"];
    nvcFour.tabBarItem.title = @"设置";
	
    _tabbar = [[UITabBarController alloc] init];
    _tabbar.viewControllers = [NSArray arrayWithObjects:homePageNvc,vctwo,nvcThree,nvcFour,nil];
    _tabbar.selectedIndex = 0;
    _tabbar.delegate = self;
	
	//将容器tabbar添加的窗口中
	[self.view addSubview:_tabbar.view];
    
}

//UITabBarController委托的方法，点击完毕事件
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
	NSLog(@"======%d",[tabBarController.viewControllers indexOfObject:viewController]);
	//viewController.tabBarItem.badgeValue = @"5";
}

@end
