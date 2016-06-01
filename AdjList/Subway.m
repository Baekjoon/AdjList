//
//  Subway.m
//  AdjList
//
//  Created by Baekjoon Choi on 6/1/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import "Subway.h"
#import "Graph.h"
#import "AdjList.h"

@interface Subway ()

@property (strong) NSMutableArray *stationList; // 정수 -> 역 이름
@property (strong) NSMutableDictionary *stationDict; // 역 이름 -> 정수

@end

@implementation Subway

-(instancetype)init {
    self = [super init];
    if (self) {
        self.stationList = [NSMutableArray array];
        self.stationDict = [NSMutableDictionary dictionary];
        [self loadStation];
    }
    return self;
}

-(void)loadStation {
    NSArray *arr = @[@"대화", @"주엽", @"정발산", @"마두", @"백석", @"대곡", @"화정", @"원당", @"원흥", @"삼송", @"지축", @"구파발", @"연신내", @"불광", @"녹번", @"홍제", @"무악재", @"독립문", @"경복궁(정부서울청사)", @"안국", @"종로3가", @"을지로3가", @"충무로", @"동대입구", @"약수", @"금호", @"옥수", @"압구정", @"신사", @"잠원", @"고속터미널", @"교대(법원·검찰청)", @"남부터미널(예술의전당)", @"양재(서초구청)", @"매봉", @"도곡", @"대치", @"학여울", @"대청", @"일원", @"수서", @"가락시장", @"경찰병원", @"오금"];
    [self.stationList addObjectsFromArray:arr];
    for (NSUInteger i = 0; i < self.stationList.count; i++) {
        self.stationDict[self.stationList[i]] = @(i+1);
    }
    // arr -> statioList와 stationDict
}

// [self nameToIndex:@"정발산"] -> 3
-(NSInteger)nameToIndex:(NSString *)stationName {
    return [self.stationDict[stationName] integerValue];
}

// [self indexToName:3] -> @"정발산"
-(NSString *)indexToName:(NSInteger)index {
    return self.stationList[index-1];
}

-(NSInteger)stations {
    return self.stationList.count;
}

-(void)addEdgeToGraph:(Graph *)graph {
    for (NSUInteger i = 0; i < self.stationList.count - 1; i++) {
        NSString *fromStation = self.stationList[i];
        NSString *toStation = self.stationList[i+1];
        NSInteger fromNumber = [self nameToIndex:fromStation];
        NSInteger toNumber = [self nameToIndex:toStation];
        // fromStation <-> toStation 양방향 Edge
        // fromNum <-> toNumber 양방향 Edge
        [graph.adj addEdgeWithFrom:fromNumber andTo:toNumber andBidirection:YES];
    }
}

@end
