//
//  main.m
//  AdjList
//
//  Created by Baekjoon Choi on 5/30/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdjList.h"
#import "NSMutableArray+Queue.h"

void dfs(AdjList *adj, NSMutableArray *check, NSInteger node) {
    if ([check[node] boolValue] == YES) {
        // node는 이미 방문을 했다.
        return;
    }
    // node번째는 첫 방문
    check[node] = @(YES);
    NSLog(@"%zd 방문", node);
    // adj[node];
    //    ↓
    // 알아서 변환
    //      ↓
    // [adj objectAtIndexedSubscript:node];
    for (id next in adj[node]) {
        dfs(adj, check, [next integerValue]);
    }
}

void bfs(AdjList *adj, NSInteger vertex, NSInteger start) {
    NSMutableArray *check = [NSMutableArray array];
    for (NSInteger i=0; i<=vertex; i++) {
        [check addObject:@(NO)];
    }
    
    NSMutableArray *queue = [NSMutableArray array];
    [queue push:@(start)];
    check[start] = @(YES);
    
    while (![queue empty]) {
        NSInteger now = [[queue pop] integerValue];
        NSLog(@"%zd 방문", now);
        
        // 다음에 방문할 정점을 찾는다
        for (id nextObj in adj[now]) {
            NSInteger next = [nextObj integerValue];
            // 여기서 검사해야할 것은 무엇인가!
            if ([check[next] boolValue] == NO) {
                // next를 방문한다 -> next를 큐에 넣는다
                [queue push:@(next)];
                check[next] = @(YES);
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger vertex = 6;
        AdjList *adj = [[AdjList alloc] initWithVertex:vertex];
        [adj addEdgeWithFrom:1 andTo:2 andBidirection:YES];
        [adj addEdgeWithFrom:1 andTo:5 andBidirection:YES];
        [adj addEdgeWithFrom:2 andTo:3 andBidirection:YES];
        [adj addEdgeWithFrom:2 andTo:4 andBidirection:YES];
        [adj addEdgeWithFrom:2 andTo:5 andBidirection:YES];
        [adj addEdgeWithFrom:5 andTo:4 andBidirection:YES];
        [adj addEdgeWithFrom:4 andTo:3 andBidirection:YES];
        [adj addEdgeWithFrom:4 andTo:6 andBidirection:YES];
        [adj sortList];
        [adj printList];
        
        NSMutableArray *check = [NSMutableArray array];
        for (NSInteger i=0; i<=vertex; i++) {
            [check addObject:@(NO)];
        }
        
        NSLog(@"DFS 시작");
        dfs(adj, check, 1);
        
        NSLog(@"BFS 시작");
        bfs(adj, vertex, 1);
        
        // NSNumber *num = @(2);
        // NSLog(@"%@",num[20]);
        
    }
    return 0;
}
