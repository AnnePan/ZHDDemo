//
//  NSAttributedString+Additions.m
//  PAJKCardFramework
//
//  Created by wangweishun@pajk.cn on 4/25/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "NSAttributedString+Additions.h"

@implementation NSAttributedString (Additions)

+ (NSAttributedString *)attributedWithStrikethroughString:(NSString *)string {
    return [NSAttributedString attributedWithStriketString:string strikethroughRange:NSMakeRange(0, [string length])];
}

+ (NSAttributedString *)attributedWithStriketString:(NSString *)string strikethroughRange:(NSRange)range
{
    if (string.length == 0) {
        return nil;
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    return attributeString;
}

@end
