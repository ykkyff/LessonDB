//
//  RegisterViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegissResquest.h"




@interface RegisterViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


//系统照片选择器
@property(nonatomic,strong)UIImagePickerController *imagePickerController;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.userImage.layer.cornerRadius = 30.f;
    self.userImage.layer.masksToBounds = YES;
    
    //   初始化图片选择器
    self.imagePickerController = [[UIImagePickerController alloc] init];
    
    //    设置代理
    self.imagePickerController.delegate = self;
    
//    回收键盘
    self.userNameTF.delegate = self;
    self.passwordTF.delegate = self;
    
}




//button 点击事件   选择相册  还是相机
- (IBAction)openPhotos:(UIButton *)sender {
    
    //    控制器提醒模块
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];

    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"选择相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self openCamera];
        NSLog(@"选择相机");
        
    }];;
    
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"选择相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self openPhoto];

    }];
    
    [alertController addAction:photo];
    [alertController addAction:camera];
    
    //        显示这个对话框视图控制器即可
    [self presentViewController:alertController animated:YES completion:nil];



}



//打开相册
- (void)openPhoto{
    
    [self presentViewController:self.imagePickerController animated:YES completion:^{
        
        NSLog(@"打开相册");
    }];
    
}


// 打开相机
- (void)openCamera {
    // UIImagePickerControllerCameraDeviceRear 后置摄像头
    // UIImagePickerControllerCameraDeviceFront 前置摄像头
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) {
        NSLog(@"没有摄像头");
        return ;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    // 编辑模式
    imagePicker.allowsEditing = YES;
    
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
    
}







//注册
- (IBAction)registerAction:(UIButton *)sender {

    if ([self.userNameTF.text length]== 0||[self.passwordTF.text length]==0) {
//        NSLog(@"请输入完整");
//        控制器提醒模块
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注意哦" message:@"请输入完整" preferredStyle:(UIAlertControllerStyleActionSheet)];
//        设置确定取消模块
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
//        添加在控制器上
        [alertController addAction:cancel];
        [alertController addAction:ok];
//        显示这个对话框视图控制器即可
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else
    {
    RegissResquest *request = [[RegissResquest alloc] init];
    [request registerWithName:self.userNameTF.text password:self.passwordTF.text avatar:self.userImage.image success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        NSString *code = [[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1005"]) {
            NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
            //        保存头像
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
//            立即保存 必须写
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜你" message:@"注册成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            
//            完毕后 界面模态回去
            [self dismissViewControllerAnimated:YES completion:nil];
        }else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"不好一丝" message:@"注册失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    }
}




#pragma mark ------ 图片选择器 选择图片的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{

    UIImage *selectImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.userImage.image = selectImage;

    [self dismissViewControllerAnimated:YES completion:nil];
}








//回收键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


//回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
    return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
