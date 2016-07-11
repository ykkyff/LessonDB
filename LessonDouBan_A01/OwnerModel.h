//
//  OwnerModel.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel

//举办方名字
@property (nonatomic,copy) NSString *name;

//头像
@property (nonatomic,copy) NSString *avatar;

//
@property (nonatomic,copy) NSString *uid;

//购买票网址
@property (nonatomic,copy) NSString *alt;

//站点
@property (nonatomic,copy) NSString *type;

//
@property (nonatomic,copy) NSString *ID;

//大头像
@property (nonatomic,copy) NSString *large_avatar;






@end
