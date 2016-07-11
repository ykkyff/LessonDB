//
//  NetWorkRequest.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "NetWorkRequest.h"


@implementation NetWorkRequest
//请求数据
//@url 请求地址
//@parameterDic 请求参数
//@success 成功回调block
//@failure 失败回调block

- (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponse:(SuccessResponse)success
       failureResponse:(FailureResponse)failure
{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    调整输出格式,接口是蓝鸥写的.
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    [manager GET:url parameters:parameterDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        
    }];

}




//POST 请求  登录  注册
- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
        successResponse:(SuccessResponse)success
                failure:(FailureResponse)failure
{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager POST:url parameters:parameterDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];

}




//注册:  上传图片
- (void)sendImageWithUrl:(NSString *)url
              parameters:(NSDictionary *)parameterDic
                   image:(UIImage *)uploadImage
         successResponse:(SuccessResponse)success
                 failure:(FailureResponse)failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:url parameters:parameterDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        压缩图片
        [formData appendPartWithFileData:UIImageJPEGRepresentation(uploadImage, 0.5) name:@"avatar" fileName:@"avatar.jpg" mimeType:@"application/octet-stream"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];

}




@end
