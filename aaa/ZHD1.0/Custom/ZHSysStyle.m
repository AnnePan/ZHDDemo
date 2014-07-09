//
//  ZHSysStyle.m
//  ZQZD
//
//  Created by 王 宝安 on 14-6-18.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "ZHSysStyle.h"

@implementation ZHSysStyle

+ (void)RegisterSysUI {
    if (iOSVersion >= 7.0) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRGB:0x51c00e]];
        [[UITableView appearance] setSeparatorInset:UIEdgeInsetsZero];
    } else {
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRGB:0x51c00e] opaque:YES size:CGSizeMake(320, 44)] forBarMetrics:UIBarMetricsDefault];
    }
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           [UIFont boldSystemFontOfSize:16.0], NSFontAttributeName, nil]];
    [[UIButton appearance] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

@end
