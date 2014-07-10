//
//  NSString+Additions.m
//  PAJKCardApp
//
//  Created by wangweishun on 6/18/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (CGSize)sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font {
    CGSize expectedSize = CGSizeZero;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        expectedSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    } else {
        expectedSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    return CGSizeMake(ceil(expectedSize.width), ceil(expectedSize.height));
}

- (CGSize)sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font {
    return [self sizeWithConstrainedSize:CGSizeMake(width, FLT_MAX) font:font];
}

@end
