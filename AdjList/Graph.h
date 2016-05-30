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
-(void)loadDemoData1;
-(void)loadDemoData2;
-(void)dfsWithStart:(NSInteger)start;
-(void)bfsWithStart:(NSInteger)start;
-(BOOL)checkBipartiteGraph;
@end
