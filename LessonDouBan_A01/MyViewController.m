//
//  MyViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "MyHeaderTableViewCell.h"
#import "MyTableViewCell.h"
#import <UIImageView+WebCache.h>


@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@property (nonatomic,strong) NSArray *titles;

//传值 接收登录人的昵称
@property (nonatomic,strong) NSString *nLabel;



@end

@implementation MyViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    
   // 添加登录按钮
    [self addRightNavigationItem];
    
    self.titles = @[@"我的活动",@"我的电影",@"清除缓存"];
    
//    注册
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyHeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderTableViewCell_Identity];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyTableViewCell_Identity];
    
    
}




// 添加登录按钮
- (void)addRightNavigationItem
{

    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:@"登录" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(0, 0, 40, 30);
//    字体颜色:
   [btn setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBarItemClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}


//button 点击事件
- (void)rightBarItemClicked:(UIButton *)btn
{
//    跳转登录页面
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController  *loginVC = [mainSb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    [self presentViewController:loginVC animated:YES completion:nil];
    
}








//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return 184;
    }
    
    return 80;
}






//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        MyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyHeaderTableViewCell_Identity];
//        第三方 SDWebImage
//        从本地获取头像的字符串
        NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"avatar"];
//       拼接上字符串 形成url
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://162.211.125.85%@",str]];
//        第三方添加上图片
        [cell.avatarImageView sd_setImageWithURL:url];
        
        return cell;
    }else
    {
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCell_Identity];
        cell.contentLabel.text = self.titles[indexPath.row-1];
    
        if (indexPath.row == 3) {
            
            cell.subContentLabel.text = [NSString stringWithFormat:@"%.1fM",[self getFilePath]];
        }
        
        return cell;
    }
}







//删除缓存先确定缓存
-(float)getFilePath{
    //文件管理
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //缓存路径
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    
    NSArray *cacheFileList;
    
    NSEnumerator *cacheEnumerator;
    
    NSString *cacheFilePath;
    
    unsigned long long cacheFolderSize = 0;
    
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    
    cacheEnumerator = [cacheFileList objectEnumerator];
    
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
        
        cacheFolderSize += [cacheFileAttributes fileSize];
    }
    
    //单位MB
    return cacheFolderSize/1024/1024;
}






//点击cell 清除缓存
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 3) {
//        清除缓存
        [self removeCache];
        [self.myTableView reloadData];
    }
}



//清除缓存
- (void)removeCache
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
//    获取缓存文件路径
     NSString *path = NSHomeDirectory();
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
//    第三方  SDWebImage ----------
    [[SDImageCache sharedImageCache] cleanDisk];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
