//
//  ZPBaseViewController.m
//  ZPframework
//
//  Created by 张鹏 on 16/9/27.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "ZPBaseViewController.h"
#import "Config.h"
#import "MBProgressHUD.h"

#import "NoNetWorkView.h"

@interface ZPBaseViewController ()<UINavigationControllerDelegate>


//加载数据控件
@property (strong,nonatomic) MBProgressHUD *HUD;
//没有数据时的view
@property (nonatomic,strong) NoNetWorkView *noDataView;
@end

@implementation ZPBaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //背景色
    self.view.backgroundColor =ZPWhiteColor;
    //显示tabbar
    self.isShowTabbar = YES;
    //push的时候隐藏tabbar
    self.hidesBottomBarWhenPushed = YES;
    
    //导航栏字体样式
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor greenColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    
    self.navigationItem.leftBarButtonItem = nil;
    
    
    
}



//加载控件
- (void)showLoadingAnimation
{
    //初始化进度条
    self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:self.HUD];
    self.HUD.mode = MBProgressHUDModeIndeterminate;
    self.HUD.labelText = @"加载中";
    self.HUD.square = YES;
    self.HUD.dimBackground=YES;
    [self.HUD show:YES];
    
    
}

//停止加载
- (void)stopLoadingAnimation
{
    [self.HUD removeFromSuperview];
}

//显示无数据时的view
-(void)showNoDataImage:(NSString *)imageNameStr title:(NSString *)remindText
{
//    self.noDataView=[[UIImageView alloc] init];
//    [self.noDataView setFrame:CGRectMake(0, 64,ScreenWidth, ScreenHeight-64-49)];
//    [self.noDataView setImage:[UIImage imageNamed:imageNameStr]];
//    [self.view addSubview:self.noDataView];
//    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isKindOfClass:[UITableView class]]) {
//            [self.noDataView setFrame:CGRectMake(0, 64,obj.frame.size.width, obj.frame.size.height)];
//            [obj addSubview:self.noDataView];
//        }
//    }];
    
    self.noDataView=[[NoNetWorkView alloc]init];
    [self.noDataView setimage:imageNameStr title:remindText];
    

    [self.noDataView setFrame:CGRectMake(0, 64,ScreenWidth, ScreenHeight-64-49)];
    //[self.noDataView setImage:[UIImage imageNamed:imageNameStr]];
    [self.view addSubview:self.noDataView];
    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            [self.noDataView setFrame:CGRectMake(0, 64,obj.frame.size.width, obj.frame.size.height)];
            [obj addSubview:self.noDataView];
        }
    }];
}

//table.set
-(void)viewDidLayoutSubviews
{
    __block UITableView* table;
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            table=obj;
        }
    }];
    //cell下划线居左
    if ([table respondsToSelector:@selector(setSeparatorInset:)])
    {
        [table setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([table respondsToSelector:@selector(setLayoutMargins:)])
    {
        [table setLayoutMargins:UIEdgeInsetsZero];
    }
}
//分割线居左的代理方法
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


//移除无数据时的view
-(void)removeNoDataImage
{
    if (self.noDataView)
    {
        [self.noDataView removeFromSuperview];
    }
}

//登录提示窗
-(void)showShouldLoginPoint
{
    if (!self.actionSheet)
    {
        NSString *title = @"温馨提示";
        NSString *Message = @"只有登录账户才能做此操作";
        self.actionSheet = [UIAlertController alertControllerWithTitle:title message:Message preferredStyle:UIAlertControllerStyleAlert];
        
        //修改title
        NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:@"温馨提示"];
        [alertTitleStr addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0X666666) range:NSMakeRange(0, title.length)];
        [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
        [self.actionSheet setValue:alertTitleStr forKey:@"attributedTitle"];
        
        //修改message
        NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:@"只有登录账户才能做此操作"];
        [alertMessageStr addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0X999999) range:NSMakeRange(0, Message.length)];
        [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, Message.length)];
        [self.actionSheet setValue:alertMessageStr forKey:@"attributedMessage"];
        
        
        

        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"已有账号，立即登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self goLogin];
        }];
        //[action1 setValue:UIColorFromRGB(0X275996) forKey:@"titleTextColor"];
        [self.actionSheet addAction:action1];
        
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"没有账号？立即注册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self goRegist];
            
        }];
        //[action2 setValue:UIColorFromRGB(0X275996) forKey:@"titleTextColor"];
        [self.actionSheet addAction:action2];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"暂不登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            return ;
        }];
        //[action setValue:UIColorFromRGB(0X275996) forKey:@"titleTextColor"];
        [self.actionSheet addAction:action];
    }

    [self presentViewController:self.actionSheet animated:YES completion:^{
    
    
    }];
}

//跳到登录控制器
-(void)goLogin
{
    
}

//跳到注册控制器
-(void)goRegist
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
