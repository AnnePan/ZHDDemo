//
//  UIButton+ZHDsytle.m
//  ZHD
//
//  Created by Anne Pan on 14-6-21.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "UIButton+ZHDsytle.h"

@implementation UIButton (ZHDsytle)

- (UIButton *)initPcardBTFrame:(CGRect)frame title:(NSString *)title imageBg:(NSString *)bgPath
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.titleLabel.textColor = [UIColor whiteColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:bgPath] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_hl",bgPath]] forState:UIControlStateHighlighted];
    
    return btn;
}

@end
