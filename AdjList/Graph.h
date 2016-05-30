//
//  Graph.h
//  AdjList
//
//  Created by Baekjoon Choi on 5/30/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Graph : NSObject

-(instancetype)initWithVertex:(NSInteger)vertex;
-(void)loadDemoData;
-(void)dfsWithStart:(NSInteger)start;
-(void)bfsWithStart:(NSInteger)start;
@end
