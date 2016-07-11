//
//  LoginRequest.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequest : NSObject


- (void)loginRequestWithUserName:(NSString *)userName
                        password:(NSString *)password
                         success:(SuccessResponse)succes
                         failure:(FailureResponse)failure;


@end
