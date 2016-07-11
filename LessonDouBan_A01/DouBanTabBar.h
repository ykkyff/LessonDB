//
//  DouBanTabBar.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

//创建代理
@class DouBanTabBar;
@protocol DouBanTabBarDelegate <NSObject>

- (void)DouBanItemDidClicked:(DouBanTabBar *)tabBar;

@end




#import <UIKit/UIKit.h>

@interface DouBanTabBar : UITabBar

//当前选中的tabBar 的下标
@property (nonatomic,assign) int currentSelected;



//当前 选中的item
@property (nonatomic,strong) UIButton *currentSelectedItem;


//tabbar上面所有的item
@property (nonatomic,strong) NSArray *allItems;



//代理属性
@property (nonatomic,weak) id<DouBanTabBarDelegate>DouBanDelegate;



// 初始化方法:
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame;









@end
