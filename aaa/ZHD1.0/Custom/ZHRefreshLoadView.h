//
//  ZHRefreshLoadView.h
//  ZHD
//
//  Created by 王 宝安 on 14-6-20.
//  Copyright (c) 2014年 wba. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZHRefreshLoadViewType) {
    ZHRefreshLoadViewInforMation,
    ZHRefreshLoadViewActivity,
    ZHRefreshLoadViewFindPeople,
    ZHRefreshLoadViewSquareShare,
    ZHRefreshLoadViewMobileNews,
    ZHRefreshLoadViewAskedDaily,
    ZHRefreshLoadViewGoldFire,
    ZHRefreshLoadViewTribe,
    
    ZHRefreshLoadViewMarx,
};

@interface ZHRefreshLoadView : UIView

//需要push的vc
@property (nonatomic, strong) UIViewController *pushVc;

- (id)initWithFrame:(CGRect)frame type:(ZHRefreshLoadViewType)type;

@end
