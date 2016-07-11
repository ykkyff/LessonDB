//
//  NetWorkRequest.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseRequest.h"
#import <UIKit/UIKit.h>

//  成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);

//  失败回调
typedef void(^FailureResponse)(NSError *error);


@interface NetWorkRequest : BaseRequest


//GET请求数据
- (void)requestWithUrl:(NSString *)url parameters:(NSDictionary *)parameterDic successResponse:(SuccessResponse)success failureResponse:(FailureResponse)failure;






//post 请求需要
- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
        successResponse:(SuccessResponse)success
                failure:(FailureResponse)failure;



//注册:
- (void)sendImageWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
                   image:(UIImage *)uploadImage
        successResponse:(SuccessResponse)success
                failure:(FailureResponse)failure;




@end
