//
//  LoginViewController.m
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
#import "RegisterViewController.h"
#import "MyHeaderTableViewCell.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;


@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
//    回收键盘
    self.userNameTF.delegate = self;
    self.passwordTF.delegate = self;
    
}




//登录的点击事件
- (IBAction)loginAction:(UIButton *)sender {
    
//    登录
    [self login];
}




//登录
- (void)login
{
//    验证,判断用户名密码
    if ([self.userNameTF.text length] == 0) {
        
        NSLog(@"用户名为空");
    }else if ([self.passwordTF.text length] == 0)
    {
        NSLog(@"密码为空");
    
    }else{
    LoginRequest *request = [[LoginRequest alloc] init];
    [request loginRequestWithUserName:self.userNameTF.text password:self.passwordTF.text success:^(NSDictionary *dic) {
        NSLog(@"login success = %@",dic);
//        类型转成字符串
        NSString *code = [[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1103"]) {
            
            NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
            //        保存头像
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            //            立即保存 必须写
            [[NSUserDefaults standardUserDefaults] synchronize];

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜你" message:@"登录成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//            显示
            [alert show];

            //    登录成功之后跳转返回
            [self dismissViewControllerAnimated:YES completion:^{
        
            }];
           
            
        }else
        {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"不好一丝" message:@"登录失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"login error = %@",error);
    }];
    
    }
}





//去注册
- (IBAction)registerAction:(UIButton *)sender {
    
//    
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    标识符
    RegisterViewController *registerVC = [mainSb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    
    [self presentViewController:registerVC animated:YES completion:^{
        
    }];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



//返回模态
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    
    [self dismissViewControllerAnimated:YES completion:nil];
}


//点击return回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




@end
