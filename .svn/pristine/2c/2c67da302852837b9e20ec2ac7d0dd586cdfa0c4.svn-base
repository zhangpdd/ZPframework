//
//  ZPNavigationViewController.m
//  ZPframework
//
//  Created by 张鹏 on 16/9/26.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "ZPNavigationViewController.h"
#import "Config.h"
@interface ZPNavigationViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation ZPNavigationViewController

+(void)initialize
{
    [self setupNav];
    [self setupBarBtnItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //这样写了以后就可以通过手势滑动返回上一层了
    __weak ZPNavigationViewController *weakself=self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate=weakself;
        self.delegate=weakself;
    }
}

+(void)setupNav
{
    // 背景
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    if (!([UIDevice currentDevice].systemVersion.doubleValue >= 7.0)) {
        [navBar setBackgroundImage:[UIImage imageNamed:@"NaviBar"] forBarMetrics:UIBarMetricsDefault];
        
    }
    
    // title
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSForegroundColorAttributeName] =[UIColor whiteColor] ;
    attribute[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attribute[NSBaselineOffsetAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    
    
    [navBar setTitleTextAttributes:attribute];
    
}

//按钮主题样式UITextAttributeTextShadowOffset
+(void)setupBarBtnItem
{
    UIBarButtonItem *barBtnItem = [UIBarButtonItem appearance];
    
    //普通状态
    NSMutableDictionary *norAttribute = [NSMutableDictionary dictionary];
    norAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    norAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    norAttribute[NSBaselineOffsetAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    
    [barBtnItem setTitleTextAttributes:norAttribute forState:UIControlStateNormal];
    
    //高亮状态
    NSMutableDictionary *highAttribute = [NSMutableDictionary dictionaryWithDictionary:norAttribute];
    highAttribute[NSForegroundColorAttributeName] = [UIColor redColor];
    [barBtnItem setTitleTextAttributes:highAttribute forState:UIControlStateHighlighted];
    
    //不可用状态
    NSMutableDictionary *disAttribute = [NSMutableDictionary dictionaryWithDictionary:norAttribute];
    disAttribute[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [barBtnItem setTitleTextAttributes:disAttribute forState:UIControlStateDisabled];
}


//重写这个方法：能够拦截所有push进来的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //这个方法是在当前控制器执行push的时候，禁止手势右划返回，避免出现crash的现象，（也可以不实现好像也没什么影响）
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    //判断上一个控制器和现在的控制器是不是同一个，如果是，返回。如果不是push到当前控制器，这就有效避免了同一个控制器连续push的问题
    if ([self.topViewController isMemberOfClass:[viewController class]])
    {
        return;
    }
    else
    {
        if (self.viewControllers.count != 0)
        {
            // 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = YES;
            
            if (([[[ UIDevice currentDevice ] systemVersion ] floatValue ]>= 7.0 ? 20 : 0 ))
            {
                //iOS7.0 以上左边按钮往前移20个像素
                UIBarButtonItem *negativeSpacer=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
                //这个数值可以根据情况自由变化
                negativeSpacer.width =-20 ;
                
                viewController.navigationItem.leftBarButtonItems = @[negativeSpacer,[UIBarButtonItem barButtonItemWithNorImageName:@"back" highImageName:@"back" target:self action:@selector(back)]];
            }
            else
            {
                viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithNorImageName:@"back" highImageName:@"back" target:self action:@selector(back)];
            }
        }
    }
    
    [super pushViewController:viewController animated:animated];
}


//当前控制器执行push的时候，禁止手势右划返回，避免出现crash的现象
-(void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

//返回上一个控制器
-(void)back
{
    [self popViewControllerAnimated:YES];
}

//返回根控制器
-(void)popToRoot
{
    [self popToRootViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
