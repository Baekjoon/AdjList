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
        NSInteger vertex = 6;
        Graph *graph = [[Graph alloc] initWithVertex:vertex];
        [graph loadDemoData];
        [graph dfsWithStart:1];
        [graph bfsWithStart:1];
    }
    return 0;
}
