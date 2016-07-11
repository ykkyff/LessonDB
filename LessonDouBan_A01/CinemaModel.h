//
//  CinemaModel.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseModel.h"

@interface CinemaModel : BaseModel


//大标题
@property (nonatomic,copy) NSString *title;

//正在上映的电影数
@property (nonatomic,assign) NSInteger total;

//电影评分
@property (nonatomic,copy) NSString *rating;

//上映日期
@property (nonatomic,copy) NSString *pubdate;

//评论数
@property (nonatomic,assign) NSInteger wish;

//原始标题
@property (nonatomic,copy) NSString *original_title;

//收藏数
@property (nonatomic,assign) NSInteger collection;

//星级
@property (nonatomic,copy) NSString *stars;

//所有图片
//@property (nonatomic,copy) NSString *images;

//id
@property (nonatomic,copy) NSString *ID;


//所有图片
@property (nonatomic,strong) NSDictionary *images;






@end



