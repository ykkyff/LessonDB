//
//  ActivityRequest.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityRequest.h"

@implementation ActivityRequest


- (void)activityRequestWithUrl:(NSString *)url
                     parameter:(NSDictionary *)parameterDic
                       success:(SuccessResponse)success
                       failure:(FailureResponse)failure
{

    NetWorkRequest *request = [[NetWorkRequest alloc] init];

    [request requestWithUrl:ActivityRequest_URL parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        
        failure(error);
    }];

}




@end
