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

@end
