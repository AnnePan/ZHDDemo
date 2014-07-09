//
//  UIColor+Custom.h
//  jkcarddemo
//
//  Created by wangweishun@pajk.cn on 4/18/14.
//  Copyright (c) 2014 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Custom)

/**
 *  common colors
 */
+ (UIColor *)sysColor;              //0xf3f3f3

+ (UIColor *)sysOrangeColor;        //0xffac40
+ (UIColor *)sysGreenColor;         //0x51c00e
+ (UIColor *)syslightGreenColor;    //0x82ce61
+ (UIColor *)sysBlueColor;          //0x37c1d1
+ (UIColor *)sysSeparateLineColor;  //0xebece4
+ (UIColor *)sysBlackColor;         //0x333333
+ (UIColor *)sysGrayColor;          //0x848484
+ (UIColor *)sysLightGrayColor;     //0xb2b2b2

/**
 *  font colors
 */
+ (UIColor *)fontDarkBlackColor;    //0x333333
+ (UIColor *)fontBlackColor;        //0x666666
+ (UIColor *)fontDarkGrayColor;     //0x777777
+ (UIColor *)fontGrayColor;         //0x999999
+ (UIColor *)fontLightGrayColor;    //0xcccccc
+ (UIColor *)fontRedColor;          //0xfe6a41
+ (UIColor *)fontGreenColor;        //0x51c00e

/**
 *  button colors
 */
+ (UIColor *)btnRedColor;          //0xfe6a41
+ (UIColor *)btnOrangeColor;       //0xffac40
+ (UIColor *)btnGrayColor;         //0xc4c4c4

@end
