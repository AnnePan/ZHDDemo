//
//  PJDetailSetVc.h
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-6.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZHSettingType) {
    ZHSettingTypePrivacy, //隐私设置
    ZHSettingTypeMessage,
    
    ZHSettingTypeMax
};
@interface PJDetailSetVc : UIViewController

@property (nonatomic, assign) ZHSettingType settingType;

@end
