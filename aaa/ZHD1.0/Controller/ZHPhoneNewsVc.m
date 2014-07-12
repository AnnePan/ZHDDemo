//
//  ZHPhoneNewsVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHPhoneNewsVc.h"

@interface ZHPhoneNewsVc ()

@end

@implementation ZHPhoneNewsVc

- (id)init
{
    if (self = [super init]) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"手机报";
    self.view.backgroundColor = [UIColor redColor];
}


@end
