//
//  PJDetailUpdataVc.h
//  ZHD1.0
//
//  Created by Anne Pan on 14-7-6.
//  Copyright (c) 2014年 com.pjj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZHUpdataType) {
    ZHUpdataTypeCompany, //企业资料
    
    ZHUpdataTypeMax
};
@interface PJDetailUpdataVc : UIViewController

@property (nonatomic, assign) ZHUpdataType updataType;

@end
