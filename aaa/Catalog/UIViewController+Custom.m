//
//  UIViewController+Custom.m
//  jkcarddemo
//
//  Created by wangweishun@pajk.cn on 4/17/14.
//  Copyright (c) 2014 PAJK. All rights reserved.
//

#import "UIViewController+Custom.h"
#import "UIColor+Custom.h"
#import "ZHSysStyle.h"
#import "ZHRefreshLoadView.h"

const void *HUDObject = "HUDObject";

@implementation UIViewController (Custom)

- (void)useDefaultColor {
    self.view.backgroundColor = [UIColor sysColor];
}

- (void)useiOS7BeforeStyle {
    if (iOSVersion >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self setBackBarButtonItem];
}
- (void)titleForController:(NSString *)title {
    self.title = title;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 36)];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.shadowColor = [UIColor grayColor];
    titleLabel.shadowOffset = CGSizeMake(0, 1);
    self.navigationItem.titleView = titleLabel;
}

//显示返回按钮
- (void)setBackBarButtonItem
{
    [self setBackBarButtonItemWithImageName:@"fs_arrow_left"];
}

- (void)setBackBarButtonItemWithImageName:(NSString *)imageName {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(0, 0, 24, 32)];
    if (iOSVersion >= 7.0) {
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -12, 0, 0);
    }
    [backBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

//返回上一页
- (void)back
{
    if ([self isKindOfClass:[[self.navigationController.viewControllers objectAtIndex:0] class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)popToViewController:(Class)objectClass
{
    NSArray *viewControllers = [self.navigationController viewControllers];
    for (UIViewController *tempViewController in viewControllers) {
        if ([tempViewController isKindOfClass:objectClass]) {
            [self.navigationController popToViewController:tempViewController animated:YES];
            return YES;
        }
    }
    return NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.navigationController pushViewController:viewController animated:animated];
}


@end
