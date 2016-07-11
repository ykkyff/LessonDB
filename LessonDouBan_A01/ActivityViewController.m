//
//  ActivityViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import "ActivityRequest.h"
#import "ActivityDetailViewController.h"

#import "GiFHUD.h"

@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *activityTableV;


@property (nonatomic,strong) NSMutableArray *dataArray;



@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    添加启动视图
    [GiFHUD show];
    [GiFHUD setGifWithImageName:@"pika.gif"];
    
    self.dataArray = [NSMutableArray array];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(butAction)];
    
//    注册
    [self.activityTableV registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ActivityTableViewCell_Identity];
    
    
    //    block里面self 防止循环引用
    __weak typeof (self)weakSelf = self;
    ActivityRequest *activity = [ActivityRequest new];
    
    [activity activityRequestWithUrl:ActivityRequest_URL parameter:nil success:^(NSDictionary *dic) {
        //        NSLog(@"success = %@",dic);
        
        NSArray *events = [dic objectForKey:@"events"];
//                NSLog(@"%@",events);
        
        for (NSDictionary *tempDic in events) {
            ActivityModel *model = [ActivityModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.dataArray addObject:model];
        }

        
        dispatch_async(dispatch_get_main_queue(), ^{
//            加载视图消失
            [GiFHUD dismiss];
        //        刷新UI
            [weakSelf.activityTableV reloadData];
        });

    } failure:^(NSError *error) {
        
        NSLog(@"error = %@",error);
    }];
    
}









- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCell_Identity];
    
    ActivityModel *model = [ActivityModel new];
    
    model = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.activityModel = model;
    
    
    return cell;
}



//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    ActivityModel *model = [ActivityModel new];
    
    model = [self.dataArray objectAtIndex:indexPath.row];
//    跳转传值:
    [self performSegueWithIdentifier:@"ActivityDetail" sender:model];

}





//跳转页面 传值  系统自带方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ActivityDetail"]) {
        
        ActivityDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.model = sender;
    }
}






















//    点击按钮  分享~~~~~新浪
- (void)butAction
{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"2.jpg"]];
    //    （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}


}








@end
