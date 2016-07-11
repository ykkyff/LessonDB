//
//  ActivityTableViewCell.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell


- (void)awakeFromNib {
  
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}



//set  方法名 必须是 set + 属性名 + 驼峰命名法!!
- (void)setActivityModel:(ActivityModel *)model
{
    _activityModel= model;
    
    self.titleLabel.text = model.title;
    self.dateLabel.text = [NSString stringWithFormat:@"%@-%@",model.begin_time,model.end_time];
    self.addressLabel.text = model.address;
    
    self.hobbyLabel.text =[NSString stringWithFormat:@"%ld",model.wisher_count];
    
    self.activityLabel.text = model.category;
    
    self.joinNumberLabel.text = [NSString stringWithFormat:@"%ld",model.participant_count];
    
    [self.activityImageV setImageWithURL:[NSURL URLWithString:model.image]];
    
}




@end
