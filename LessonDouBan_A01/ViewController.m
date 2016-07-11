//
//  ViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ViewController.h"
#import "ActivityRequest.h"
#import "ActivityModel.h"
#import "ActivityDetailRequest.h"

#import "TheatreRequest.h"
#import "CinemaRequest.h"
#import "CinemaDetailRequest.h"
#import "CinemaModel.h"
@interface ViewController ()
//活动数组
@property (nonatomic,strong) NSMutableArray *activitysArray;

//电影数组
@property (nonatomic,strong) NSMutableArray *moviesArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.activitysArray = [NSMutableArray array];
    self.moviesArr = [NSMutableArray array];
    
    //活动界面数据解析
//    [self requestActivityData];
    
//    活动详情页面 --- 字符串从上面数据解析中得到的ID
//    [self requestActivityDetailDataWith:@"25773150"];

    //    电影界面数据
        [self requestCinemaData];
//    电影详情
//    [self requestCinemaDetailDataWith:@"25662337"];
    
    //    影院界面
//    [self requestTheatreData];
    
}



//活动界面数据解析
- (void)requestActivityData
{
//    block里面self 防止循环引用
    __weak typeof (self)weakSelf = self;
    ActivityRequest *activity = [ActivityRequest new];
    [activity activityRequestWithUrl:ActivityRequest_URL parameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"success = %@",dic);
        
        NSArray *events = [dic objectForKey:@"events"];
//        NSLog(@"%@",events);
        
        for (NSDictionary *tempDic in events) {
            ActivityModel *model = [ActivityModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.activitysArray addObject:model];
        }
        
        NSLog(@"%@",weakSelf.activitysArray);
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}



//活动详情 ID 从活动界面解析得到
- (void)requestActivityDetailDataWith:(NSString *)ID
{
    ActivityDetailRequest *request = [[ActivityDetailRequest alloc] init];

    [request activityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
}




//电影详情
- (void)requestCinemaDetailDataWith:(NSString *)ID
{
    CinemaDetailRequest *request  = [[CinemaDetailRequest alloc] init];
    [request cinemaDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}




//    电影界面数据
- (void)requestCinemaData
{
    __weak typeof (self)weakSelf =self;
    CinemaRequest *cinema = [CinemaRequest new];
    
    [cinema cinemaRequestWithUrl:CinemaRequest_URL parameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
//        NSString *movieTitle = [dic objectForKey:@"title"];
        NSArray *tempMovies = [dic objectForKey:@"entries"];
        for (NSDictionary *tempDic in tempMovies) {
            CinemaModel *model  = [CinemaModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.moviesArr addObject:model];
        }
        NSLog(@"%@",weakSelf.moviesArr);
        
    } failure:^(NSError *error) {
        NSLog(@"---------%@",error);
        
    }];
}





//影院界面数据
- (void)requestTheatreData
{
    TheatreRequest *theatre = [TheatreRequest new];
    [theatre theatreRequestUrl:TheatreRequest_URL parameter:nil success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
