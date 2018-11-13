//
//  ZPBaseViewController.h
//  ZPframework
//
//  Created by 张鹏 on 16/9/27.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPBaseViewController : UIViewController



- (void)messageBar;

//是否显示tabbar
@property (nonatomic,assign)Boolean isShowTabbar;

//需要登录的提示窗口
@property (nonatomic,strong)UIAlertController *actionSheet;

- (void)createNavBar;

//显示没有数据页面
-(void)showNoDataImage:(NSString *)imageNameStr title:(NSString *)remindText;

//移除无数据页面
-(void)removeNoDataImage;

//需要登录
- (void)showShouldLoginPoint;

//加载视图
- (void)showLoadingAnimation;

//停止加载
- (void)stopLoadingAnimation;

//分享页面  *  @param url   url  @param title 标题
- (void)shareUrl:(NSString *)url andTitle:(NSString *)title;

- (void)goRegist;
- (void)goLogin;

//状态栏
- (void)initStatusBar;

- (void)showStatusBarWithTitle:(NSString *)title;

- (void)changeStatusBarTitle:(NSString *)title;
- (void)hiddenStatusBar;

@end
