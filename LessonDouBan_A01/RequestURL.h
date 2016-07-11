//
//  RequestURL.h
//  LessonDouBan_A01
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#ifndef RequestURL_h
#define RequestURL_h

//活动请求url
#define ActivityRequest_URL @"http://api.douban.com/v2/event/list?type=all&district=all&loc=108288&photo_cate=image&photo_count=5&start=0&day_type=future&apikey=062bcf31694a52d212836d943bdef876"


//活动详情URL    定义动态拼接,有参数的宏定义 #define <#macro#>(<#args#>)
#define ActivityDetailRequest(ID)[NSString stringWithFormat:@"https://api.douban.com/v2/event/%@/photos?count=5&apikey=062bcf31694a52d212836d943bdef876",ID]





//影院的
#define TheatreRequest_URL @"http://115.28.227.1/teacher/yihuiyun/lanouproject/cinemalist.php"


//电影请求
#define CinemaRequest_URL @"https://api.douban.com/v2/movie/nowplaying?app_name=doubanmovie&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%ACversion=2&start=0&apikey=0df993c66c0c636e29ecbb5344252a4a"


//电影详情页面
#define cinemaDetailRequest(ID)[NSString stringWithFormat:@"https://api.douban.com/v2/movie/subject/%@?apikey=0df993c66c0c636e29ecbb5344252a4a",ID]



//登录接口
#define LoginRequest_Url @"http://162.211.125.85/douban/user.php/DLogin"

//注册接口
#define RegissRequest_Url @"http://162.211.125.85/douban/user.php/DRegister"








#endif /* RequestURL_h */
