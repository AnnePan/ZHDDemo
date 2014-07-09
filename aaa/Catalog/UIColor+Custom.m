//
//  UIColor+Custom.m
//  jkcarddemo
//
//  Created by wangweishun@pajk.cn on 4/18/14.
//  Copyright (c) 2014 PAJK. All rights reserved.
//

#import "UIColor+Custom.h"
#import "UIColor+Additions.h"

@implementation UIColor (Custom)

#pragma mark - common colors
+ (UIColor *)sysColor {
    return [UIColor colorWithRGB:0xf3f3f3];
}

+ (UIColor *)sysOrangeColor {
    return [UIColor colorWithRGB:0xffac40];
}

+ (UIColor *)sysGreenColor {
    return [UIColor colorWithRGB:0x51c00e];
}

+ (UIColor *)syslightGreenColor {
    return [UIColor colorWithRGB:0x82ce61];
}

+ (UIColor *)sysBlueColor {
    return [UIColor colorWithRGB:0x37c1d1];
}

+ (UIColor *)sysSeparateLineColor {
    return [UIColor colorWithRGB:0xebece4];
}

+ (UIColor *)sysBlackColor {
    return [UIColor colorWithRGB:0x333333];
}

+ (UIColor *)sysGrayColor {
    return [UIColor colorWithRGB:0x848484];
}

+ (UIColor *)sysLightGrayColor {
    return [UIColor colorWithRGB:0xb2b2b2];
}

#pragma mark - font colors

+ (UIColor *)fontDarkBlackColor {
   return [UIColor colorWithRGB:0x333333];
}

+ (UIColor *)fontBlackColor {
    return [UIColor colorWithRGB:0x666666];
}

+ (UIColor *)fontDarkGrayColor {
    return [UIColor colorWithRGB:0x777777];
}

+ (UIColor *)fontGrayColor {
    return [UIColor colorWithRGB:0x999999];
}

+ (UIColor *)fontLightGrayColor {
    return [UIColor colorWithRGB:0xcccccc];
}

+ (UIColor *)fontRedColor {
    return [UIColor colorWithRGB:0xfe6a41];
}

+ (UIColor *)fontGreenColor {
    return [UIColor colorWithRGB:0x51c00e];
}

#pragma mark - button colors
+ (UIColor *)btnRedColor {
    return [UIColor colorWithRGB:0xfe6a41];
}

+ (UIColor *)btnOrangeColor {
    return [UIColor colorWithRGB:0xffac40];
}

+ (UIColor *)btnGrayColor {
    return [UIColor colorWithRGB:0xc4c4c4];
}

@end
