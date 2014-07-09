//
//  ZHBaseVc.m
//  ZHD
//
//  Created by 王 宝安 on 14-6-19.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import "ZHBaseVc.h"


@implementation ZHBaseVc

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self useiOS7BeforeStyle];
    [self useDefaultColor];
}

- (void)setControllerTitle:(NSString *)controllerTitle
{
    _controllerTitle = controllerTitle;
    [self titleForController:_controllerTitle];
}

- (ZHRefreshLoadView *)refreshloadView:(CGRect)rect type:(ZHRefreshLoadViewType)type
{
    return [[ZHRefreshLoadView alloc] initWithFrame:rect type:type];
}




@end
