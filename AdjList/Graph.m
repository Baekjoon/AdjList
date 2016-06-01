//
//  Graph.m
//  AdjList
//
//  Created by Baekjoon Choi on 5/30/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import "Graph.h"
#import "AdjList.h"
#import "Edge.h"
#import "NSMutableArray+Queue.h"

@interface Graph ()

@property (strong) AdjList *adj;
@property (readwrite) NSInteger vertex;

-(void)dfsAndCurrentVertex:(NSInteger)now andVisited:(NSMutableArray *)check;
-(BOOL)checkBipartiteGraphAndCurrentVertex:(NSInteger)now andColor:(NSInteger)color andColorArray:(NSMutableArray *)colorArray;

@end

@implementation Graph

-(instancetype)init {
    self = [super init];
    if (self) {
        self.vertex = 0;
        self.adj = nil;
    }
    return self;
}

-(instancetype)initWithVertex:(NSInteger)vertex {
    self = [super init];
    if (self) {
        self.vertex = vertex;
        self.adj = [[AdjList alloc] initWithVertex:vertex];
    }
    return self;
}

-(void)loadDemoData1 {
    self.vertex = 6;
    self.adj = [[AdjList alloc] initWithVertex:self.vertex];
    [self.adj addEdgeWithFrom:1 andTo:2 andBidirection:YES];
    [self.adj addEdgeWithFrom:1 andTo:5 andBidirection:YES];
    [self.adj addEdgeWithFrom:2 andTo:3 andBidirection:YES];
    [self.adj addEdgeWithFrom:2 andTo:4 andBidirection:YES];
    [self.adj addEdgeWithFrom:2 andTo:5 andBidirection:YES];
    [self.adj addEdgeWithFrom:5 andTo:4 andBidirection:YES];
    [self.adj addEdgeWithFrom:4 andTo:3 andBidirection:YES];
    [self.adj addEdgeWithFrom:4 andTo:6 andBidirection:YES];
    [self.adj sortList];
    [self.adj printList];
}

-(void)loadDemoData2 {
    self.vertex = 6;
    self.adj = [[AdjList alloc] initWithVertex:self.vertex];
    [self.adj addEdgeWithFrom:1 andTo:4 andBidirection:YES];
    [self.adj addEdgeWithFrom:1 andTo:6 andBidirection:YES];
    [self.adj addEdgeWithFrom:2 andTo:4 andBidirection:YES];
    [self.adj addEdgeWithFrom:2 andTo:3 andBidirection:YES];
    [self.adj addEdgeWithFrom:5 andTo:6 andBidirection:YES];
    [self.adj sortList];
    [self.adj printList];
}

-(void)loadDemoData3 {
    self.vertex = 6;
    self.adj = [[AdjList alloc] initWithVertex:self.vertex];
    [self.adj addEdgeWithFrom:1 andTo:2 andBidirection:YES];
    [self.adj addEdgeWithFrom:1 andTo:5 andBidirection:YES];
    [self.adj addEdgeWithFrom:2 andTo:5 andBidirection:YES];
    [self.adj addEdgeWithFrom:4 andTo:3 andBidirection:YES];
    [self.adj addEdgeWithFrom:4 andTo:6 andBidirection:YES];
    [self.adj sortList];
    [self.adj printList];
}


-(void)dfsWithStart:(NSInteger)start {
    NSLog(@"DFS 시작");
    NSMutableArray *check = [NSMutableArray array];
    for (NSInteger i=0; i<=self.vertex; i++) {
        [check addObject:@(NO)];
    }
    [self dfsAndCurrentVertex:start andVisited:check];
}

-(void)dfsAndCurrentVertex:(NSInteger)now andVisited:(NSMutableArray *)check {
    if ([check[now] boolValue] == YES) {
        // now는 이미 방문을 했다.
        return;
    }
    // now번째는 첫 방문
    check[now] = @(YES);
    NSLog(@"%zd 방문", now);
    // adj[now];
    //    ↓
    // 알아서 변환
    //    ↓
    // [adj objectAtIndexedSubscript:now];
    for (Edge *e in self.adj[now]) {
        [self dfsAndCurrentVertex:e.to andVisited:check];
    }
}

-(void)bfsWithStart:(NSInteger)start {
    NSLog(@"BFS 시작");
    NSMutableArray *check = [NSMutableArray array];
    for (NSInteger i=0; i<=self.vertex; i++) {
        [check addObject:@(NO)];
    }
    
    NSMutableArray *queue = [NSMutableArray array];
    [queue push:@(start)];
    check[start] = @(YES);
    
    while (![queue empty]) {
        NSInteger now = [[queue pop] integerValue];
        NSLog(@"%zd 방문", now);
        
        // 다음에 방문할 정점을 찾는다
        for (Edge *e in self.adj[now]) {
            NSInteger next = e.to;
            // 여기서 검사해야할 것은 무엇인가!
            if ([check[next] boolValue] == NO) {
                // next를 방문한다 -> next를 큐에 넣는다
                [queue push:@(next)];
                check[next] = @(YES);
            }
        }
    }
}


-(BOOL)checkBipartiteGraph {
    NSMutableArray *colorArray = [NSMutableArray array];
    for (NSInteger i=0; i<=self.vertex; i++) {
        [colorArray addObject:@(0)];
    }
    
    for (NSInteger i = 1; i <= self.vertex; i++) {
        if ([colorArray[i] integerValue] == 0) {
            if (![self checkBipartiteGraphAndCurrentVertex:i andColor:1 andColorArray:colorArray]) {
                return NO;
            }
        }
    }
    return YES;
}

-(BOOL)checkBipartiteGraphAndCurrentVertex:(NSInteger)now andColor:(NSInteger)color andColorArray:(NSMutableArray *)colorArray {
    if ([colorArray[now] integerValue] != 0) {
        return YES;
    }
    
    colorArray[now] = @(color);
    
    for (Edge *e in self.adj[now]) {
        NSInteger next = e.to;
        NSInteger nextColor = [colorArray[next] integerValue];
        // 다음 정점을 아직 방문하지 않았으면
        if (nextColor == 0) {
            if (![self checkBipartiteGraphAndCurrentVertex:next andColor:3-color andColorArray:colorArray]) {
                return NO;
            }
        } else { // 이미 방문했으면
            if (color == nextColor) {
                return NO;
            }
        }
    }
    return YES;
}

-(NSInteger)countConnectedComponents {
    NSInteger components = 0;
    NSMutableArray *check = [NSMutableArray array];
    for (NSInteger i=0; i<=self.vertex; i++) {
        [check addObject:@(NO)];
    }
    for (NSInteger i = 1; i <= self.vertex; i++) {
        if ([check[i] boolValue] == NO) {
            [self dfsAndCurrentVertex:i andVisited:check];
            components += 1;
        }
    }
    return components;
}

@end
