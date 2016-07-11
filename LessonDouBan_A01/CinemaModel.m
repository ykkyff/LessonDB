//
//  CinemaModel.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if([key isEqualToString:@"id"])
    {
        
        _ID = value;
    }
    
}



//格式化输出  成为新的输出易懂格式
- (NSString *)description
{
    return [NSString stringWithFormat:@"ID = %@ image = %@",self.ID,self.images];

}



@end
