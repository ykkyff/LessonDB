//
//  MovieTableViewCell.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"
#import "CinemaModel.h"

#define MovieTableViewCell_Identity @"MovieTableViewCell_Identity"


@interface MovieTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageV;

//名字
@property (strong, nonatomic) IBOutlet UILabel *movieName;

//星级
@property (strong, nonatomic) IBOutlet UILabel *starsNumberLab;

//时间
@property (strong, nonatomic) IBOutlet UILabel *dateNumberLab;


@property (nonatomic,strong) CinemaModel *model;





@end
