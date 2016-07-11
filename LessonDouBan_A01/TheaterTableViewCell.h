//
//  TheaterTableViewCell.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheatreModel.h"

#define TheaterTableViewCell_Identifier @"TheaterTableViewCell_Identifier"

@interface TheaterTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;


@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;


@property (nonatomic,strong) TheatreModel *model;


@end
