//
//  RootViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"


@interface RootViewController ()<DouBanTabBarDelegate>

@property (nonatomic,strong) DouBanTabBar *dbTabBar;



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    隐藏
//    self.tabBar.hidden = YES;
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn1 setImage:[UIImage imageNamed:@"paper.png"] forState:(UIControlStateNormal)];
    [btn1 setImage:[UIImage imageNamed:@"paperH.png"] forState:(UIControlStateSelected)];
    /**
     *   Button 自带 Image 属性的偏移量
     *
     *  @param top   距离上边缘的尺寸
     *  @param left   距离左边缘的尺寸
     *  @param bottom  距离下边缘的尺寸
     *  @param right 距离右边缘的尺寸
     *
     *  @return 图片的偏移距离
     */
    [btn1 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn1 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    
    [btn1 setFont:[UIFont systemFontOfSize:12]];
    [btn1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn1 setTitle:@"活动" forState:(UIControlStateNormal)];
//   点击 改变字体颜色
    [btn1 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn2 setImage:[UIImage imageNamed:@"video.png"] forState:(UIControlStateNormal)];
    [btn2 setImage:[UIImage imageNamed:@"videoH.png"] forState:(UIControlStateSelected)];
    [btn2 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn2 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    [btn2 setFont:[UIFont systemFontOfSize:12]];
    [btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn2 setTitle:@"电影" forState:(UIControlStateNormal)];
    [btn2 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    [self.view addSubview:btn2];
    
    
    UIButton *btn3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn3 setImage:[UIImage imageNamed:@"2image.png"] forState:(UIControlStateNormal)];
    [btn3 setImage:[UIImage imageNamed:@"2imageH.png"] forState:(UIControlStateSelected)];
    [btn3 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn3 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    [btn3 setFont:[UIFont systemFontOfSize:12]];
    [btn3 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn3 setTitle:@"影院" forState:(UIControlStateNormal)];
    [btn3 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    [self.view addSubview:btn3];
    
    
    UIButton *btn4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn4 setImage:[UIImage imageNamed:@"person.png"] forState:(UIControlStateNormal)];
    [btn4 setImage:[UIImage imageNamed:@"personH.png"] forState:(UIControlStateSelected)];
    [btn4 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn4 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    [btn4 setFont:[UIFont systemFontOfSize:12]];
    [btn4 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn4 setTitle:@"我的" forState:(UIControlStateNormal)];
    [btn4 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    [self.view addSubview:btn4];
    
    
    
    self.dbTabBar = [[DouBanTabBar alloc] initWithItems:@[btn1,btn2,btn3,btn4] frame:CGRectMake(0, WindowHeight-49, WindownWidth, self.tabBar.bounds.size.height)];
   
    [self.view addSubview:self.dbTabBar];

//    设置代理
    self.dbTabBar.DouBanDelegate = self;
    
}


//调用代理方法---------------  实现
- (void)DouBanItemDidClicked:(DouBanTabBar *)tabBar
{
    self.selectedIndex = tabBar.currentSelected;
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
