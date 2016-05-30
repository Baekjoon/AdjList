//
//  main.m
//  AdjList
//
//  Created by Baekjoon Choi on 5/30/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdjList.h"
#import "NSNumber+Square.h"
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
        
        dfs(adj, check, 1);
        
        // NSNumber *num = @(2);
        // NSLog(@"%@",num[20]);
        
    }
    return 0;
}
