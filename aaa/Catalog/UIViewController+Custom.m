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

#pragma mark - PAMBProgressHUD
- (PAMBProgressHUD *)MBProgressHUD {
    PAMBProgressHUD *HUD = objc_getAssociatedObject(self, &HUDObject);
    if (!HUD) {
        HUD = [[PAMBProgressHUD alloc] initWithView:self.view];
        HUD.minSize = CGSizeMake(112, 112);
        HUD.mode = MBProgressHUDModeIndeterminate;
        objc_setAssociatedObject(self, &HUDObject, HUD, OBJC_ASSOCIATION_RETAIN);
        [self.view addSubview:HUD];
        
        UIView *fullBackground = [[UIView alloc] initWithFrame:self.view.frame];
        fullBackground.origin = CGPointZero;
        fullBackground.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [HUD insertSubview:fullBackground atIndex:0];
    }
    return HUD;
}

- (void)show:(NSString *)text {
    PAMBProgressHUD *HUD = [self MBProgressHUD];
    HUD.mode = MBProgressHUDModeIndeterminate;
    if (text != nil) {
        HUD.labelText = text;
    }
    [HUD show:YES];
}

- (void)showSuccess:(NSString *)text {
    [self showWithText:text resultType:YES];
}

- (void)showError:(NSString *)text {
    [self showWithText:text resultType:NO];
}

- (void)dismiss {
    PAMBProgressHUD *HUD = [self MBProgressHUD];
    [HUD hide:YES];
}

- (void)showWithText:(NSString *)text resultType:(BOOL) resultType {
    PAMBProgressHUD *HUD = [self MBProgressHUD];
    UIImage *customerImage = [UIImage imageNamed:resultType?@"PASuccessWhite":@"PAErrorWhite"];
    HUD.customView = [[UIImageView alloc] initWithImage:customerImage];
    HUD.mode = MBProgressHUDModeCustomView;
    [self show:text ProgressHUD:HUD afterDelay:resultType ? 2 : 1];
}

- (void)show:(NSString *)labelText afterDelay:(NSTimeInterval)afterDelay {
    if (labelText != nil) {
        PAMBProgressHUD *HUD = [self MBProgressHUD];
        HUD.mode = MBProgressHUDModeIndeterminate;
        HUD.labelText = labelText;
        [HUD show:YES];
        [HUD hide:YES afterDelay:afterDelay];
    }
}

- (void)show:(NSString *)labelText ProgressHUD:(PAMBProgressHUD *)HUD afterDelay:(NSTimeInterval)afterDelay {
    if (labelText != nil) {
        HUD.labelText = labelText;
    }
    [HUD show:YES];
    [HUD hide:YES afterDelay:afterDelay];
}


@end
