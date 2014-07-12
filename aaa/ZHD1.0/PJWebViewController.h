//
//  PAWebViewController.h
//  PAJKCardApp
//
//  Created by Josh.Shron on 14-6-27.
//  Copyright (c) 2014年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "PJWebView.h"

/**
 *  通用的webview页面
 */

@interface PJWebViewController : UIViewController

/**
 *  @param url  url链接
 */
- (instancetype)initWithUrl:(NSString *)url;

/**
 *  @param url             url链接
 *  @param title UIviewController的title
 */
- (instancetype)initWithUrl:(NSString *)url title:(NSString *)title;

@end
