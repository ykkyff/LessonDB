//
//  ActivityTableViewCell.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
#define ActivityTableViewCell_Identity @"ActivityTableViewCell_Identity"


@interface ActivityTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic) IBOutlet UILabel *activityLabel;

@property (strong, nonatomic) IBOutlet UILabel *hobbyLabel;

@property (strong, nonatomic) IBOutlet UILabel *joinNumberLabel;

@property (strong, nonatomic) IBOutlet UIImageView *activityImageV;


@property (nonatomic,strong) ActivityModel *activityModel;


//- (void)setModel:(ActivityModel *)model;




@end
