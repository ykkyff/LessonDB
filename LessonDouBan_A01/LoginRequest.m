//
//  LoginRequest.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest



- (void)loginRequestWithUserName:(NSString *)userName
                        password:(NSString *)password
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request sendDataWithUrl:LoginRequest_Url parameters:@{@"userName":userName,@"password":password} successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}




@end
