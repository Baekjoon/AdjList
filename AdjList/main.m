//
//  main.m
//  AdjList
//
//  Created by Baekjoon Choi on 5/30/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Graph *graph = [[Graph alloc] init];
        [graph loadDemoData1];
        [graph dfsWithStart:1];
        [graph bfsWithStart:1];
        NSLog(@"이분 그래프인가요? %d", [graph checkBipartiteGraph]);
        
        [graph loadDemoData2];
        [graph dfsWithStart:1];
        [graph bfsWithStart:1];
        NSLog(@"이분 그래프인가요? %d", [graph checkBipartiteGraph]);
    }
    return 0;
}
