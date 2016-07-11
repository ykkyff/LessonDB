//
//  MovieViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "MOvieDetailViewController.h"
#import "CinemaRequest.h"
#import "CinemaModel.h"

@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *movieTableV;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end


@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    
//    注册
    [self.movieTableV registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MovieTableViewCell_Identity];
    
//    解析数据:
    __weak typeof (self)weakSelf =self;
    CinemaRequest *cinema = [CinemaRequest new];
    [cinema cinemaRequestWithUrl:CinemaRequest_URL parameter:nil success:^(NSDictionary *dic) {
        
        NSArray *tempMovies = [dic objectForKey:@"entries"];
        
        for (NSDictionary *tempDic in tempMovies) {
            CinemaModel *model  = [CinemaModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.dataArray addObject:model];
        }
        
//        NSLog(@"%@",weakSelf.dataArray);
//       刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
        
            [weakSelf.movieTableV reloadData];
        });
     
        
    } failure:^(NSError *error) {
        NSLog(@"---------%@",error);
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

    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell_Identity];
    
    CinemaModel *model  = [CinemaModel new];
    
    model = self.dataArray[indexPath.row];
    
    cell.model = model;

    return cell;
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    CinemaModel *model = [CinemaModel new];
    model = self.dataArray[indexPath.row];
    
//   在 storyboard 连线show 添加标识符MovieDetail, 在这直接跳转
    [self performSegueWithIdentifier:@"MovieDetail" sender:model];

    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Navigation
//系统自带方法   传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
//    如果跳转的是这个页面
    if ([segue.identifier isEqualToString:@"MovieDetail"]) {
        
       MOvieDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.model = sender;
        
    }
}





@end
