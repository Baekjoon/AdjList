//
//  Subway.h
//  AdjList
//
//  Created by Baekjoon Choi on 6/1/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subway : NSObject

-(NSInteger)nameToIndex:(NSString *)stationName;
-(NSString *)indexToName:(NSInteger)index;

@end
