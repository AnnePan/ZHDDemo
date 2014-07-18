//
//  ZHRequestAPI.h
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-9.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHRequestAPI : NSObject

///请求通讯录数据
+ (NSArray *)requestContacts;

///请求每日一问
+ (NSArray *)requestEveryDayq;

///请求所有手机报
+ (NSArray *)requestNews;

///请求所有部落
+ (NSArray *)requestClans;

///请求所有部落
+ (NSArray *)requestIndustry;

@end
