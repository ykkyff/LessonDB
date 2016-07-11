//
//  OwnerModel.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "OwnerModel.h"

@implementation OwnerModel


//格式化输出,ID = %@,  按照这个格式输出出来
- (NSString *)description
{

    return [NSString stringWithFormat:@"ID = %@",self.ID];
}




- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        
        _ID = value;
    }
}



@end
