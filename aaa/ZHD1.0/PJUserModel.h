//
//  PJUserModel.h
//  BusinessCircle
//
//  Created by Anne Pan on 14-6-18.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PJUserModel : NSObject

@property (nonatomic, copy)NSString *uId;           //用户ID

@property (nonatomic, copy)NSString *uName;         //用户名

@property (nonatomic, copy)NSString *uFirstWord;    //头字母

@property (nonatomic, copy)NSString *uCompany;      //公司及职务

@property (nonatomic, copy)NSString *uPicPath;      //头像路径

@property (nonatomic, copy)NSArray *uPeapleColor;   //岛民类型：绿色，蓝色

@property (nonatomic, assign)BOOL uIsVIP;           //是否是VIP


@property (nonatomic, assign)long long uTelphone;   //电话号码

@property (nonatomic, copy)NSString *uWeChatNum;    //微信号码

@property (nonatomic, copy)NSString *uEmail;        //电子邮箱

@property (nonatomic, copy)NSString *uRecommender;  //推荐人

@property (nonatomic, copy)NSArray *uFires;         //全部火种


@end
