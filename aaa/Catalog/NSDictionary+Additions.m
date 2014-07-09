//
//  NSDictionary+Additions.m
//  PAJKCardApp
//
//  Created by wangweishun@pajk.cn on 5/22/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "NSDictionary+Additions.h"

@interface NSArray (NSNullReplace)

- (NSArray *)arrayByReplacingNullsWithBlanks;

@end

@implementation NSArray (NSNullReplace)

- (NSArray *)arrayByReplacingNullsWithBlanks  {
    NSMutableArray *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    for (int idx = 0; idx < [replaced count]; idx++) {
        id object = [replaced objectAtIndex:idx];
        if (object == nul) {
            [replaced replaceObjectAtIndex:idx withObject:blank];
        }
        else if ([object isKindOfClass:[NSDictionary class]]) {
            [replaced replaceObjectAtIndex:idx withObject:[object dictionaryByReplacingNullsWithBlanks]];
        }
        else if ([object isKindOfClass:[NSArray class]]) {
           [replaced replaceObjectAtIndex:idx withObject:[object arrayByReplacingNullsWithBlanks]];
        }
    }
    return [replaced copy];
}

@end

@implementation NSDictionary (Additions)

- (id)jsonObjectForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSNull class]]) {
        object = nil;
    }

    return object;
}

- (NSDictionary *)dictionaryByReplacingNullsWithBlanks {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";

    for (NSString *key in self) {
        id object = [self objectForKey:key];
        if (object == nul) {
            [replaced setObject:blank forKey:key];
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            [replaced setObject:[object dictionaryByReplacingNullsWithBlanks] forKey:key];
        } else if ([object isKindOfClass:[NSArray class]]) {
            [replaced setObject:[object arrayByReplacingNullsWithBlanks] forKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

@end
