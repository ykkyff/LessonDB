//
//  ActivityModel.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel


//格式化输出,ID = %@,  按照这个格式输出出来
- (NSString *)description
{
    return [NSString stringWithFormat:@"ID = %@,owner = %@",self.ID,self.user];
}



//容错处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if([key isEqualToString:@"id"])
    {
        _ID = value;
    }else if ([key isEqualToString:@"owner"])
    {
        OwnerModel *model = [OwnerModel new];
        [model setValuesForKeysWithDictionary:value];
        _user = model;
        
    }
}



@end
