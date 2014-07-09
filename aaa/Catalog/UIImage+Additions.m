//
//  UIImage+Additions.m
//  PAJKCardFramework
//
//  Created by wangweishun@pajk.cn on 4/24/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

#pragma mark - size
- (UIImage *)resizableImage {
    CGSize imageSize = self.size;
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(imageSize.height / 2, imageSize.width / 2, imageSize.height / 2, imageSize.width / 2)];
}

#pragma mark - color
+ (UIImage *)imageWithColor:(UIColor *)color opaque:(BOOL)opaque size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, opaque, 0);
    [color set];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    [path fill];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)roundedImageWithColor:(UIColor *)color opaque:(BOOL)opaque size:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    UIGraphicsBeginImageContextWithOptions(size, opaque, 0);
    [color set];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:cornerRadius];
    [path fill];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)imageWithColor:(UIColor *)color opaque:(BOOL)opaque size:(CGSize)size shape:(UIBezierPath *)shape {
    UIGraphicsBeginImageContextWithOptions(size, opaque, 0);
    [color set];
    [shape fill];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
