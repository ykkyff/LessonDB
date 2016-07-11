//
//  TheatreModel.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "TheatreModel.h"

@implementation TheatreModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if([key isEqualToString:@"id"])
    {
    
        _ID = value;
    }
    
}





@end
