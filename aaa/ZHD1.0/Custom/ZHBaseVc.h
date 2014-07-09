//
//  ZHBaseVc.h
//  ZHD
//
//  Created by 王 宝安 on 14-6-19.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHRefreshLoadView.h"

@interface ZHBaseVc : UIViewController
{
    UITableView *_tableView;
}

@property(nonatomic, copy) NSString *controllerTitle;

- (ZHRefreshLoadView *)refreshloadView:(CGRect)rect type:(ZHRefreshLoadViewType)type;

@end
