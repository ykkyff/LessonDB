//
//  TheatreRequest.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "TheatreRequest.h"

@implementation TheatreRequest

- (void)theatreRequestUrl:(NSString *)url
                parameter:(NSDictionary *)parameterDic
                  success:(SuccessResponse)success
                  failure:(FailureResponse)failure
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];

    [request requestWithUrl:url parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        
        failure(error);
    }];
    
}





@end
