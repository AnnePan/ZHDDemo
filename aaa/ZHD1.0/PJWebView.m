//
//  PAWebView.m
//  PAJKCardApp
//
//  Created by wangweishun on 6/27/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "PJWebView.h"

@interface PJWebView()
{
    UIWebView *_webView;
    UIActivityIndicatorView *_indicatorView;
}

@end

@implementation PJWebView

- (void)dealloc
{
    _webView.delegate = nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _webView = [[UIWebView alloc] initWithFrame:self.bounds];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _webView.delegate = self;
        [self addSubview:_webView];

        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        _indicatorView.size = CGSizeMake(40, 40);
        _indicatorView.center = _webView.center;
        [self addSubview:_indicatorView];

        _autoAdjustHeightWithContent = NO;
    }
    return self;
}

- (void)loadWithUrl:(NSString *)url
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
     [_webView loadHTMLString:string baseURL:baseURL];
}

- (void)reload
{
    [_webView reload];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_indicatorView stopAnimating];

    CGSize size = [webView sizeThatFits:CGSizeZero];
    if (_contentSizeBlock) {
        _contentSizeBlock(size);
    }

    if (_autoAdjustHeightWithContent) {
        self.height = webView.height = size.height;
    }

    if (self.htmlTitleBlock) {
        _htmlTitleBlock([webView stringByEvaluatingJavaScriptFromString:@"document.title"]);
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //判断是否是单击
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
//        NSURL *url = [request URL];
//        if([[UIApplication sharedApplication]canOpenURL:url])
//        {
//            [[UIApplication sharedApplication]openURL:url];
//        }
//        return NO;
    }
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_indicatorView stopAnimating];
    NSLog(@"failed to load: %@", error);
}

@end
