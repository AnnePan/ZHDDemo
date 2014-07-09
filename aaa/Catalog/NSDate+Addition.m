//
//  NSDate+Addition.m
//  PAJKCardApp
//
//  Created by panjuanjuan@pajk.cn on 14-6-5.
//  Copyright (c) 2014年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)

+ (NSString *)getFormatTime:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *dateDF = [[NSDateFormatter alloc] init];
    [dateDF setDateFormat:format];
    return [dateDF stringFromDate:date];
}
@end
