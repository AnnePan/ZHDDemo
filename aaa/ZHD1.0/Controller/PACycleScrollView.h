//
//  CycleScrollView.h
//  PagedScrollView
//
//  Created by baolongxie on 14-6-19.
//  Copyright (c) 2014年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

/**
 *  这个类适合scroll的整页滑动
 */

@class PACycleScrollView;

@protocol CycleScrollViewDataSource <NSObject>

/**
 *  初始化视图
 */
- (UIView *)cycleScrollView:(PACycleScrollView *)cycleScrollView;

/**
 *  视图加载数据
 */
- (UIView *)cycleScrollView:(PACycleScrollView *)cycleScrollView setDataForView:(UIView *)view forIndexPath:(NSInteger)index;

/**
 *  数据源：获取总的page个数/
 */
- (NSUInteger)numberOfCycleScrollView:(PACycleScrollView *)cycleScrollView;

@optional

/**
 *  当前视图所在的位置
 */
- (void)cycleScrollView:(PACycleScrollView *)cycleScrollView viewAtIndex:(NSInteger)index;

@end

@protocol CycleScrollViewDelegate <NSObject>
@optional

/**
 *  当点击事件
 */
- (void)cycleScrollView:(PACycleScrollView *)cycleScrollView didCycleScrollViewAtIndex:(NSInteger)index;

@end

@interface PACycleScrollView : UIView

@property(nonatomic, assign) id<CycleScrollViewDataSource> dataSource;
@property(nonatomic, assign) id<CycleScrollViewDelegate> delegate;
@property (nonatomic , assign) NSTimeInterval animationDuration; //自动滚动的时间 如果<=0，不自动滚动。
@property (nonatomic , assign) BOOL isCycleBool; // 是否循环滚动

/**
 *  数据更新
 */
- (void)reloadData;

/**
 *  停止滚动  这是在自动滚动的时候才调用的方法
 */
- (void)autoScrollStop;

/**
 *  开始时间在初始化的时候决定了， 所以这不需要再设置开始的时间  这是在自动滚动的时候才调用的方法
 */
-(void)autoScrollStart;

@end