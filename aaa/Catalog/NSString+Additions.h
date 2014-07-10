//
//  NSString+Additions.h
//  PAJKCardApp
//
//  Created by wangweishun on 6/18/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

- (CGSize)sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font;
- (CGSize)sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font;

@end
