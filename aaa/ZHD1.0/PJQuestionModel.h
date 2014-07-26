//
//  PJQuestionModel.h
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-12.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PJQuestionModel : NSObject


@property (nonatomic, copy)NSString *uId;           //用户ID

@property (nonatomic, copy)NSString *uName;         //用户名

@property (nonatomic, copy)NSString *uPicPath;      //头像路径


@property (nonatomic, copy)NSString *qTitle;        //每日一问标题

@property (nonatomic, copy)NSString *qText;         //每日一问文本

@property (nonatomic, copy)NSArray *qTransfers;     //所有转评

@property (nonatomic, copy)NSArray *qAddtions;      //所有加金

@property (nonatomic, copy)NSString *qTimeStr;      //评论时间


@end
