//
//  PAWebView.h
//  PAJKCardApp
//
//  Created by wangweishun on 6/27/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

/**
 *  一个通用UIWebView类
 */

typedef void (^GetHtmlTitleBlock)(NSString *title);
typedef void (^GetHtmlContentSizeBlock)(CGSize size);

@interface PJWebView : UIView <UIWebViewDelegate>

/**
 *  根据页面内容自动调整高度
 */
@property (nonatomic, assign) BOOL autoAdjustHeightWithContent; //default NO

@property (nonatomic, copy) GetHtmlTitleBlock htmlTitleBlock;    //h5加载完成后获取标题
@property (nonatomic, copy) GetHtmlContentSizeBlock contentSizeBlock; //获取h5内容的size

- (void)loadWithUrl:(NSString *)url;
- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;

- (void)reload;

@end
