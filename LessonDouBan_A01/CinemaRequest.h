//
//  CinemaRequest.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"

@interface CinemaRequest : NSObject

- (void)cinemaRequestWithUrl:(NSString *)url
                   parameter:(NSDictionary *)parameterDic
                     success:(SuccessResponse)success
                     failure:(FailureResponse)failure;


@end
