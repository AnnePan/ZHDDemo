//
//  UILabel+Additions.m
//  TestDemo
//
//  Created by wangweishun@pajk.cn on 4/25/14.
//  Copyright (c) 2014 PAJK. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (void)setLineSpace:(CGFloat)lineSpace {
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 6 && self.text) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = lineSpace;
        NSDictionary *ats = @{
                              NSFontAttributeName : self.font,
                              NSForegroundColorAttributeName : self.textColor,
                              NSParagraphStyleAttributeName : paragraphStyle
                              };
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:ats];
    }
}

- (CGFloat)attributedTextHeight {
    CGRect rect = [self.attributedText boundingRectWithSize:CGSizeMake(self.width, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size.height;
}

- (void)sizeToFitNumberOfLines {
    CGFloat height = 0;
    if (self.text) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
            NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            self.font, NSFontAttributeName, nil];
            CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.width, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDict context:nil];
            height = rect.size.height;
        } else {
            CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.width, FLT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
            height = size.height;
        }
    } else {
        height = [self attributedTextHeight];
    }
    self.height = height;
}

- (void)setLabelStyleTextColor:(UIColor *)color fontSize:(CGFloat)size
{
    self.textColor = color;
    self.font = [UIFont systemFontOfSize:size];
    self.backgroundColor = [UIColor clearColor];
}

@end
