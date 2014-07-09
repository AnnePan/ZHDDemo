//
//  NSTimer+Addition.h
//  PagedScrollView
//
//  Created by baolongxie on 14-6-19.
//  Copyright (c) 2014年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  CycleScrollView  类中的时间相关属性 
 */
@interface NSTimer (Addition)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
