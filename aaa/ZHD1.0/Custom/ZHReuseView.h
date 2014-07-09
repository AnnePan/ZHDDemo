//
//  ZHReuseView.h
//  ZHD
//
//  Created by Anne Pan on 14-6-21.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PJUserModel;

@interface ZHReuseView : UIView

//初始化个人名片界面用户信息
- (id)initUser2WithFrame:(CGRect)frame user:(PJUserModel *)user;

//初始化个人名片界面联络信息
- (id)initContactVWithFrame:(CGRect)frame user:(PJUserModel *)user;

@end
