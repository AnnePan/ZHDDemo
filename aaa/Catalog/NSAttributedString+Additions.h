//
//  NSAttributedString+Additions.h
//  PAJKCardFramework
//
//  Created by wangweishun@pajk.cn on 4/25/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Additions)

+ (NSAttributedString *)attributedWithStrikethroughString:(NSString *)string;

+ (NSAttributedString *)attributedWithStriketString:(NSString *)string strikethroughRange:(NSRange)range;

@end
