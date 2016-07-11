//
//  DouBanTabBar.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "DouBanTabBar.h"

@implementation DouBanTabBar


//初始化方法:
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame
{
    self = [super init];
    
    if (self) {
        self.frame = frame;
        
        for (int i = 0; i < items.count; i++) {
            
            UIButton *btn = (UIButton *)items[i];
            CGFloat width = self.bounds.size.width/items.count;
            CGFloat height = self.bounds.size.height;
            btn.frame = CGRectMake(i* width, 0, width, height);
            [self addSubview:btn];
            
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
            
        }
        self.currentSelected = 0;
        self.currentSelectedItem = items[0];
        self.allItems = items;
    }

    return self;
}




//button 点击事件
- (void)btnClicked:(UIButton *)btn
{
    self.currentSelectedItem = btn;
    
    for (int i = 0; i < self.allItems.count; i++) {
        
        UIButton *tempBtn = (UIButton *)self.allItems[i];
        
        if (btn == tempBtn) {
            
            self.currentSelected = i;
            
            tempBtn.selected = YES;
        }else
        {
            tempBtn.selected = NO;
        
        }
    }
//    
    if (_DouBanDelegate) {
        
        [_DouBanDelegate DouBanItemDidClicked:self];
    }
}







@end
