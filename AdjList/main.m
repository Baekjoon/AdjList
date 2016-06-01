//
//  main.m
//  AdjList
//
//  Created by Baekjoon Choi on 5/30/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"
#import "Subway.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Subway *subway = [[Subway alloc] init];
        NSLog(@"%zd", [subway nameToIndex:@"신사"]);
        
        Graph *graph = [[Graph alloc] initWithVertex:subway.stations];
        [subway addEdgeToGraph:graph];
        
        NSString *start = @"신사";
        NSInteger startNumber = [subway nameToIndex:start];
        NSString *end = @"종로3가";
        NSInteger endNumber = [subway nameToIndex:end];
        NSArray *path = [graph bfsWithStart:startNumber andEnd:endNumber];
        NSMutableArray *pathWithName = [NSMutableArray array];
        for (NSNumber *num in path) {
            [pathWithName addObject:[subway indexToName:[num integerValue]]];
        }
        NSLog(@"%@",[pathWithName componentsJoinedByString:@" => "]);
    
        
        /*Graph *graph = [[Graph alloc] init];
        [graph loadDemoData1];
        [graph dfsWithStart:1];
        [graph bfsWithStart:1];
        NSLog(@"이분 그래프인가요? %d", [graph checkBipartiteGraph]);
        NSLog(@"연결 요소의 개수는 %zd개", [graph countConnectedComponents]);
        
        [graph loadDemoData2];
        [graph dfsWithStart:1];
        [graph bfsWithStart:1];
        NSLog(@"이분 그래프인가요? %d", [graph checkBipartiteGraph]);
        NSLog(@"연결 요소의 개수는 %zd개", [graph countConnectedComponents]);
        
        [graph loadDemoData3];
        [graph dfsWithStart:1];
        [graph bfsWithStart:1];
        NSLog(@"이분 그래프인가요? %d", [graph checkBipartiteGraph]);
        NSLog(@"연결 요소의 개수는 %zd개", [graph countConnectedComponents]);*/
    }
    return 0;
}
