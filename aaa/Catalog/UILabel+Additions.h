//
//  UILabel+Additions.h
//  TestDemo
//
//  Created by wangweishun@pajk.cn on 4/25/14.
//  Copyright (c) 2014 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Additions)

- (void)setLineSpace:(CGFloat)lineSpace; //setting line space for attributedText
- (CGFloat)attributedTextHeight;         //get the attributedText height
- (void)sizeToFitNumberOfLines;          //size to fit number of lines for both text and attributedText

- (void)setLabelStyleTextColor:(UIColor *)color fontSize:(CGFloat)size;
@end
