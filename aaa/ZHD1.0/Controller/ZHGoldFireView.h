//
//  ZHGoldFireView.h
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-7.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZHFireType) {
    ZHFireTypeAll,      //所有火种
    ZHFireTypeGold,     //金火种
    
    ZHFireTypeMax
};

@interface ZHGoldFireView : UIView

- (void)setSourceArray:(NSArray *)sourceArray fireType:(ZHFireType)fireType;

@end
