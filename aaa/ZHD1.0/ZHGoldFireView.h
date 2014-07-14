//
//  ZHGoldFireView.h
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-7.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZHCellType) {
    ZHCellTypeAllFire,      //所有火种
    ZHCellTypeGoldFire,     //金火种
    ZHCellTypeQuestion,     //每日一问
    ZHCellTypeDearAnswer,   //热心岛邻
    ZHCellTypeNews,         //手机报
    ZHCellTypeActivity,     //活动
    ZHCellTypeChat,         //会话
    ZHCellTypeDocument,     //文档
    ZHCellTypeMember,       //成员
    
    ZHFireTypeMax
};

@interface ZHGoldFireView : UIView

- (void)setSourceArray:(NSArray *)sourceArray fireType:(ZHCellType)fireType;

@end
