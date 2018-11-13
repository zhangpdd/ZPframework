//
//  homeViewController.m
//  ZPframework
//
//  Created by 张鹏 on 16/9/27.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "TestViewController.h"
#import "Config.h"
#import "HttpRequest.h"
#import "MBProgressHUD+MP.h"

//二维码
#import "SGGenerateQRCodeVC.h"
#import "SGScanningQRCodeVC.h"
#import <AVFoundation/AVFoundation.h>
#import "SGAlertView.h"

//测试网络
#import "SGNetObserver.h"

//广告
#import "ADView.h"
#import "ADViewController.h"

//没有网络的效果图
#import "NoNetWorkView.h"


//代码布局
#import "Masonry.h"

//历史记录
#import "SearchViewController.h"

//头试图下拉放大
#import "HeadViewController.h"

#define getcitylistUrl @"http://139.196.50.83:8044/City/getcitylist"
#define getCollectionListUrl @"http://139.196.50.83:8044/User/getCollectionList"
@interface TestViewController ()

//有无网络的通知
@property (nonatomic,strong) SGNetObserver *observer;
//没有网络的效果图
@property(strong,nonatomic)NoNetWorkView *noNetWorkView;


@property(strong,nonatomic)UIButton *head;
@property(strong,nonatomic)UIButton *la;

@end


static const CGFloat KTextLabelFontSize=13;

@implementation TestViewController

-(NoNetWorkView *)noNetWorkView
{
    if (_noNetWorkView == nil) {
        _noNetWorkView = [[NoNetWorkView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - 49)];
        _noNetWorkView.hidden = true;
        [self.view addSubview:_noNetWorkView];
    }
    return _noNetWorkView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    NSString *image = @"http://img5q.duitang.com/uploads/item/201505/25/20150525223238_NdQrh.thumb.700_0.png";
    NSString *ad = @"http://tieba.baidu.com/";
    
    //1、创建广告
    ADView *adView = [[ADView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds imgUrl:image adUrl:ad clickImg:^(NSString *clikImgUrl) {
        NSLog(@"进入广告:%@",clikImgUrl);
        ADViewController *adVc = [[ADViewController alloc] init];
        adVc.adUrl = clikImgUrl;
        [self.navigationController pushViewController:adVc animated:YES];
        
    }];
    //设置倒计时（默认3秒）
    adView.showTime = 10;
    
    //2、显示广告
    [adView show];
    
    
    
    
    //[MBProgressHUD showSuccess:@"hahhah" ToView:self.view];
    //[MBProgressHUD showLoadToView:self.view];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
    //[MBProgressHUD showCustomIcon:@"no_network" Title:@"hhh" ToView:self.view];
    [MBProgressHUD showAutoMessage:@"123" ToView:self.view];
    //[MBProgressHUD showMessage:@"111" ToView:self.view];
//    NSMutableDictionary *parms = [[NSMutableDictionary alloc]init];
//    [parms setObject:@"651" forKey:@"userId"];
//    [parms setObject:@"121" forKey:@"lat"];
//    [parms setObject:@"32" forKey:@"lng"];
//    HttpRequest *httpRequest = [HttpRequest sharedInstance];
//    [httpRequest GET:getCollectionListUrl parameters:parms progress:^(float progress) {
//        NSLog(@"%f",progress);
//    } succeed:^(id data) {
//        NSLog(@"%@", data);
//    } failure:^(NSError *error) {
//        NSLog(@"====%@", error);
//    }];
    
    [self showNoDataImage:@"no_network" title:@"可以改变的text"];
    
    
    //[self showLoadingAnimation];
    NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(scrollTimer) userInfo:nil repeats:NO];
    
    [[NSRunLoop mainRunLoop] addTimer:myTimer forMode: UITrackingRunLoopMode];
    
    
    //二维码
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 50)];
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 50)];
    
    btn1.backgroundColor=[UIColor greenColor];
    btn2.backgroundColor=[UIColor greenColor];
    
    [btn1 setTitle:@"扫描二维码" forState:UIControlStateNormal];
    [btn2 setTitle:@"生成二维码" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1act) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(btn1act) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    
    
    
    self.observer = [SGNetObserver defultObsever];
    [self.observer startNotifier];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStatusChanged:) name:SGReachabilityChangedNotification object:nil];
    
    
    
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(20, 450, 300, 100)];
    label1.numberOfLines=0;
    label1.text=@"意在抒写边防将士之乡情。前二句写月下边塞的景色；三句写声音，闻见芦管悲声；四句写心中感受，芦笛能动征人回乡之望。全诗把景色、声音，感受融为一体，意境浑成。《唐诗纪事》说这首诗在当时便被度曲入画。仔细体味全诗意境，确也是谱歌作画的佳品";
    label1.font=AdaptedFontSize(KTextLabelFontSize);
    [self.view addSubview:label1];
    
    
    //代码布局九宫格
    [self loadNewView];
    
    
    
}

-(void)loadNewView
{
    //用来记录上一次创建的UILabel
    UIButton *lastLabel = nil;
    
    self.head=[UIButton new];
    self.head.backgroundColor=ZPGreenColor;
    [self.head setTitle:@"头像" forState:UIControlStateNormal];
    [self.view addSubview:self.head];
    [self.head mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(150);
        make.left.offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        
        
        
    }];

    [self.head addTarget:self action:@selector(headview) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 0; i < 9; i++)
    {
        UIButton *label = [UIButton new];
        [label setTitle:[NSString stringWithFormat:@"~%d~",i] forState:UIControlStateNormal];
        [self.view addSubview:label];
        
        [label addTarget:self action:@selector(history) forControlEvents:UIControlEventTouchUpInside];
        if (i%3==0)
        {
            label.backgroundColor=ZPRedColor;
        }
        else if (i%3==1)
        {
            label.backgroundColor=ZPGrayColor;
        }
        else if (i%3==2)
        {
            label.backgroundColor=ZPOrangeColor;
        }
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            //设置UIlabel高度
            make.height.equalTo(label.mas_width);
            //第一个label 距离父视图 上边 200 的间隔 左边 20的间隔
            if (i==0)
            {
                make.top.offset(200);
                make.left.equalTo(self.head.mas_right).offset(10);
            }
            else
            {
                if (i%3 == 0)
                {
                    //当是 左边一列的时候 都是 距离父视图 向左边 20的间隔
                    make.left.equalTo(self.head.mas_right).offset(10);
                    make.top.equalTo(lastLabel.mas_bottom).offset(10);
                }
                else
                {
                    //当时中间列的时候 在上一个UIlabel的右边 添加20个 距离 并且设置等宽
                    make.width.equalTo(lastLabel.mas_width);
                    make.left.equalTo(lastLabel.mas_right).offset(10);
                    make.top.equalTo(lastLabel);
                }
                if (i%3 == 2)
                {
                    //当是 最右边列的时候 距离右边父视图的 距离为20  因为是向左所以是-20  控制底部也是 负数!!
                    make.right.offset(-20);
                }
            }
            
            
            
            
            
        }];
        lastLabel = label;
    
    }
    
    
}

-(void)headview
{
    HeadViewController *head=[[HeadViewController alloc]init];
    
    [self.navigationController pushViewController:head animated:YES];
}
-(void)history
{
    SearchViewController *s=[[SearchViewController alloc]init];
    
    [self.navigationController pushViewController:s animated:YES];
}


-(void)scrollTimer
{
    [self stopLoadingAnimation];
}

//扫描二维码
-(void)btn1act
{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        SGScanningQRCodeVC *VC = [[SGScanningQRCodeVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
        
    } else {
        
        SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"未检测到您的摄像头, 请在真机上测试" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
        [alertView show];
        
        //        // 1、初始化UIAlertController
        //        UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"未检测到您的摄像头, 请在真机上测试" preferredStyle:UIAlertControllerStyleAlert];
        //
        //        // 2.设置UIAlertAction样式
        //        UIAlertAction *sureAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //
        //        }];
        //
        //        [aC addAction:sureAc];
        //        // 3.显示alertController:presentViewController
        //        [self presentViewController:aC animated:YES completion:nil];
    }

}
//生成二维码
-(void)btn2act
{
    SGGenerateQRCodeVC *VC = [[SGGenerateQRCodeVC alloc] init];
    
    [self.navigationController pushViewController:VC animated:YES];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SGReachabilityChangedNotification object:nil];
}
- (void)networkStatusChanged:(NSNotification *)notify{
    NSLog(@"notify-------%@",notify.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    NSLog(@"%f",self.head.frame.size.width / 2);
    self.head.layer.cornerRadius = self.head.frame.size.width/2;
}

@end
