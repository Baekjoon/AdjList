//
//  Subway.m
//  AdjList
//
//  Created by Baekjoon Choi on 6/1/16.
//  Copyright © 2016 Startlink. All rights reserved.
//

#import "Subway.h"

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
    NSArray *arr = @[@"소요산", @"동두천", @"보산", @"동두천중앙", @"지행", @"덕정", @"덕계", @"양주", @"녹양", @"가능", @"의정부", @"회룡", @"망월사", @"도봉산", @"도봉", @"방학", @"창동", @"녹천", @"월계", @"광운대", @"석계", @"신이문", @"외대앞", @"회기", @"청량리(서울시립대입구)", @"제기동", @"신설동", @"동묘앞", @"동대문", @"종로5가", @"종로3가", @"종각", @"시청", @"서울역", @"남영", @"용산", @"노량진", @"대방", @"신길", @"영등포", @"신도림", @"구로", @"구일", @"개봉", @"오류동", @"온수", @"역곡", @"소사", @"부천", @"중동", @"송내", @"부개", @"부평", @"백운", @"동암", @"간석", @"주안", @"도화", @"제물포", @"도원", @"동인천", @"인천", @"가산디지털단지", @"독산", @"금천구청", @"석수", @"관악", @"안양", @"명학", @"금정", @"군포", @"당정", @"의왕", @"성균관대", @"화서", @"수원", @"세류", @"병점", @"세마", @"오산대", @"오산", @"진위", @"송탄", @"서정리", @"지제", @"평택", @"성환", @"직산", @"두정", @"천안", @"봉명", @"쌍용(나사렛대)", @"아산", @"배방", @"온양온천", @"신창(순천향대)", @"광명", @"서동탄"];
    NSLog(@"%d",arr.count);
}

@end
