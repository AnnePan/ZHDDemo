//
//  UIImage+Additions.h
//  PAJKCardFramework
//
//  Created by wangweishun@pajk.cn on 4/24/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>

@interface UIImage (Additions)

- (UIImage *)resizableImage;

+ (UIImage *)imageWithColor:(UIColor *)color opaque:(BOOL)opaque size:(CGSize)size;
+ (UIImage *)roundedImageWithColor:(UIColor *)color opaque:(BOOL)opaque size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (UIImage *)imageWithColor:(UIColor *)color opaque:(BOOL)opaque size:(CGSize)size shape:(UIBezierPath *)shape;

@end
