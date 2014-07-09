//
//  UIColor+Additions.h
//  jkcarddemo
//
//  Created by wangweishun@pajk.cn on 4/17/14.
//  Copyright (c) 2014 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

+ (UIColor *)colorWithRGB:(int)rgb;
+ (UIColor *)colorWithRGB:(int)rgb alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithRGB:(NSUInteger)r green:(NSInteger)g blue:(NSUInteger)b;
+ (UIColor *)colorWithRGB:(NSUInteger)r green:(NSInteger)g blue:(NSUInteger)b alpha:(CGFloat)a;

@end
