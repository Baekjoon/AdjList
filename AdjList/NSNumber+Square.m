//
//  NSNumber+Square.m
//  AdjList
//
//  Created by Baekjoon Choi on 5/30/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import "NSNumber+Square.h"

@implementation NSNumber (Square)
-(id)objectAtIndexedSubscript:(NSUInteger)idx {
    NSInteger ans = 1;
    for (int i=0; i<idx; i++) {
        ans *= [self integerValue];
    }
    return @(ans);
}
@end
