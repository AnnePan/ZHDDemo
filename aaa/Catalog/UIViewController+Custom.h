//
//  UIViewController+Custom.h
//  jkcarddemo
//
//  Created by wangweishun@pajk.cn on 4/17/14.
//  Copyright (c) 2014 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <objc/runtime.h>

@interface UIViewController (Custom)

- (void)setBackBarButtonItem;
- (void)setBackBarButtonItemWithImageName:(NSString *)imageName;

//返回事件
- (void)back;

- (void)useDefaultColor;
- (void)useiOS7BeforeStyle;
- (void)titleForController:(NSString *)title;
- (BOOL)popToViewController:(Class)objectClass;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
