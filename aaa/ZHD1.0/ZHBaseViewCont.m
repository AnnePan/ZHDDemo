//
//  ZHBaseViewCont.m
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-21.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import "ZHBaseViewCont.h"

@interface ZHBaseViewCont ()

@end

@implementation ZHBaseViewCont

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
    [self useDefaultColor];
    [self useiOS7BeforeStyle];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
