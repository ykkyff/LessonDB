//
//  MyHeaderTableViewCell.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

// MyHeaderTableViewCell  的重用标识符
#define MyHeaderTableViewCell_Identity @"MyHeaderTableViewCell_Identity"
#define MyTableViewCell_Identity @"MyTableViewCell_Identity"

@interface MyHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (strong, nonatomic) IBOutlet UILabel *username;



@end
