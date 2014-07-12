//
//  PAWebViewController.m
//  PAJKCardApp
//
//  Created by Josh.Shron on 14-6-27.
//  Copyright (c) 2014年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "PJWebViewController.h"

@interface PJWebViewController ()

@property (nonatomic, strong) PJWebView *webView;
@property (nonatomic, strong) NSString *urlPath;

@end

@implementation PJWebViewController

- (instancetype)initWithUrl:(NSString *)url
{
    return [self initWithUrl:url title:nil];
}

- (instancetype)initWithUrl:(NSString *)url title:(NSString *)title
{
    if (self = [super init]) {
        self.title = title;
        self.urlPath = url;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self useDefaultColor];
    [self useiOS7BeforeStyle];

    PJWebView *webView = [[PJWebView alloc] initWithFrame:self.view.bounds];
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [webView loadWithUrl:self.urlPath];
    [self.view addSubview:webView];

    if (self.title) {
        [self titleForController:self.title];
    } else {
        __weak UIViewController *wself = self;
        webView.htmlTitleBlock = ^(NSString *title) {
            wself.navigationItem.title = title;
        };
    }
}

@end
