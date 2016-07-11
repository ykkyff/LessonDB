//
//  MovieTableViewCell.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



- (void)setModel:(CinemaModel *)model{

    _model = model;
    
    self.movieName.text = model.title;
    
    self.starsNumberLab.text = model.stars;
    
    self.dateNumberLab.text = model.pubdate;
    
    [self.imageV setImageWithURL:[NSURL URLWithString:model.images[@"medium"]]];

}





@end
