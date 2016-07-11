//
//  RegissResquest.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "RegissResquest.h"

@implementation RegissResquest


//注册
- (void)registerWithName:(NSString *)name
                password:(NSString *)password
                  avatar:(UIImage *)image
                 success:(SuccessResponse)sucess
                 failure:(FailureResponse)failure
{
    NSDictionary *parameter = @{@"userName":name,@"password":password};

    NetWorkRequest *request = [NetWorkRequest new];

    [request sendImageWithUrl:RegissRequest_Url parameters:parameter image:image successResponse:^(NSDictionary *dic) {
        sucess(dic);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}







@end
