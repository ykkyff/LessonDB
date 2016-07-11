//
//  CinemaDetailRequest.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaDetailRequest : NSObject

- (void)cinemaDetailRequestWithParameter:(NSDictionary *)parameter
                                 success:(SuccessResponse)success
                                 failure:(FailureResponse)failure;

@end
