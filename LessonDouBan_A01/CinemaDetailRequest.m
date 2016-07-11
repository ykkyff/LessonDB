//
//  CinemaDetailRequest.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "CinemaDetailRequest.h"

@implementation CinemaDetailRequest


- (void)cinemaDetailRequestWithParameter:(NSDictionary *)parameter
                                 success:(SuccessResponse)success
                                 failure:(FailureResponse)failure

{

    NetWorkRequest *request = [[NetWorkRequest alloc] init];

    NSString *ID = [parameter objectForKey:@"id"];
    
    [request requestWithUrl:cinemaDetailRequest(ID) parameters:parameter successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        failure(error);
        
    }];
    


}





@end
