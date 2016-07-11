//
//  MOvieDetailViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MOvieDetailViewController.h"
@interface MOvieDetailViewController ()
//电影图片
@property (strong, nonatomic) IBOutlet UIImageView *imageV;
//评分
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
//评论
@property (strong, nonatomic) IBOutlet UILabel *commentsLabel;
//日期
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
//时长
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
//种类
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
//产地
@property (strong, nonatomic) IBOutlet UILabel *originLabel;
//描述
@property (strong, nonatomic) IBOutlet UITextView *textView;


@end

@implementation MOvieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = _model.title;
    
    self.scoreLabel.text = _model.rating;
    self.commentsLabel.text = [NSString stringWithFormat:@"%ld",_model.wish];
    self.dateLabel.text = _model.pubdate;
    self.timeLabel.text = @"90分钟";
    self.typeLabel.text = @"电影种类";
    self.originLabel.text = @"产地";
    self.textView.text = @"电影描述";
     [self.imageV setImageWithURL:[NSURL URLWithString:self.model.images[@"medium"]]];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
