//
//  RegissResquest.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegissResquest : NSObject


//注册
- (void)registerWithName:(NSString *)name
                password:(NSString *)password
                  avatar:(UIImage *)image
                 success:(SuccessResponse)sucess
                 failure:(FailureResponse)failure;




@end
