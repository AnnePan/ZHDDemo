//
//  ZHClanModel.h
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-13.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHClanModel : NSObject


@property (nonatomic, copy) NSString *cName;        //部落名字

@property (nonatomic, assign) BOOL cIsSysClan;       //系统部落，比如广场，系统消息

@property (nonatomic, copy) NSString *cPhotoPaht;   //部落头像

@property (nonatomic, copy) NSString *cIntroduce;   //部落介绍

@property (nonatomic, assign) int cMemberCount;     //部落总人数

@property (nonatomic, copy) NSString *cLastWord;    //最后一句发言

@property (nonatomic, copy) NSString *cLastWorder;  //最后一次发言的人

@property (nonatomic, copy) NSString *cLastWordTime;//最后一次发言的时间


@end
