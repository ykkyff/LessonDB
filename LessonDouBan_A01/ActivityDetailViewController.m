//
//  ActivityDetailViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityDetailViewController.h"

@interface ActivityDetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) IBOutlet UILabel *playDaateLabel;


@property (strong, nonatomic) IBOutlet UILabel *hobbyLabel;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    点击cell 传值 在这接收 名字 赋值到 这个界面的title 上!!
    self.title = self.model.title;
//    各种接收值
    self.textView.text = self.model.content;
    self.playDaateLabel.text = self.model.begin_time;
    self.hobbyLabel.text = self.model.category;
    self.addressLabel.text = self.model.address;
    self.nameLabel.text = self.model.album;
    
    [self.imageView setImageWithURL:[NSURL URLWithString:self.model.image]];
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
