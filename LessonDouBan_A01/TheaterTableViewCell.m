//
//  TheaterTableViewCell.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "TheaterTableViewCell.h"

@implementation TheaterTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




- (void)setModel:(TheatreModel *)model
{
    _model = model;
    self.nameLabel.text = model.cinemaName;
    self.addressLabel.text = model.address;
    self.phoneLabel.text = model.telephone;
}






@end
