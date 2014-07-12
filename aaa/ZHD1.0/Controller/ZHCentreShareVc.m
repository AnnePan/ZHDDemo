//
//  ZHCentreShareVc.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHCentreShareVc.h"

@interface ZHCentreShareVc ()

@end

@implementation ZHCentreShareVc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"广场分享";
}

@end
