//
//  TheaterViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "TheaterViewController.h"
#import "TheaterTableViewCell.h"
#import "TheatreModel.h"
#import "TheatreRequest.h"
//地图专用
#import "TheaterMapViewController.h"

@interface TheaterViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *theaterTableV;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation TheaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    
//    注册
    [self.theaterTableV registerNib:[UINib nibWithNibName:@"TheaterTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TheaterTableViewCell_Identifier];
    
//    影院数据解析
    __weak typeof(self)weakSelf =self;
    TheatreRequest *theatre = [TheatreRequest new];
    [theatre theatreRequestUrl:TheatreRequest_URL parameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"========%@",dic);
        
//        此时数组里面是最后一层字典
        weakSelf.dataArray = dic[@"result"][@"data"];
    
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [weakSelf.theaterTableV reloadData];
        });
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    TheaterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TheaterTableViewCell_Identifier];
    
    TheatreModel *model = [TheatreModel new];
//    用字典接收数组里面的一个对象.
    NSDictionary *dict = self.dataArray[indexPath.row];
//    把对象中的全部值付给model;
    [model setValuesForKeysWithDictionary:dict];
    
//    实现:
    cell.model = model;
    

    return cell;
}



//点击cell  进入地图
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    地图界面:
    TheaterMapViewController *mapVC = [TheaterMapViewController new];
    NSDictionary *dic = self.dataArray[indexPath.row];
    TheatreModel *model = [TheatreModel new];
    [model setValuesForKeysWithDictionary:dic];
    mapVC.cityStr = model.cityName;
    mapVC.addressStr = model.address;
    [self.navigationController pushViewController:mapVC animated:YES];

    
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
