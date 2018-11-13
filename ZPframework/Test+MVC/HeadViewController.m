//
//  HeadViewController.m
//  ZPframework
//
//  Created by 张鹏 on 2016/10/28.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "HeadViewController.h"
#import "Masonry.h"
#import "Config.h"
#import "GCDViewController.h"

#define kHEIGHT  200    //图片高度
@interface HeadViewController ()


@property (strong, nonatomic) UITableView *tableView;


@end

@implementation HeadViewController

static NSString * const ID = @"cell";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"head放大";
    self.view.backgroundColor=ZPWhiteColor;
    
    self.navigationController.navigationBar.barTintColor=ZPRedColor;
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                                                  forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];//WithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)
    
    
    self.tableView.backgroundColor=ZPWhiteColor;
    
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.tableView.contentInset = UIEdgeInsetsMake(kHEIGHT, 0, 0, 0);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kHEIGHT, [UIScreen mainScreen].bounds.size.width, kHEIGHT)];
    imageView.backgroundColor=ZPGrayColor;
    imageView.image = [UIImage imageNamed:@"no_network"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.tag = 101;
    
    
    [self.tableView addSubview:imageView];

    [self.view addSubview:self.tableView];
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.offset(64);
//        make.left.offset(0);
//        
//        make.size.mas_equalTo(CGSizeMake(ScreenWidth, ScreenHeight));
//        
//        
//        
//    }];

    
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < -kHEIGHT) {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [self.tableView viewWithTag:101].frame = rect;
    }
    
    
    
    CGFloat minAlphaOffset = - 64;
    CGFloat maxAlphaOffset = 200;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    NSLog(@"===%f",alpha);
    self.navigationController.navigationBar.subviews.firstObject.alpha = alpha;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%ld", indexPath.section, indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    switch (indexPath.row)
    {
        case 0:
        {
            GCDViewController *gcd=[[GCDViewController alloc]init];
            [self.navigationController pushViewController:gcd animated:YES];
            
            break;
        }
        case 1:
        {
            GCDViewController *gcd=[[GCDViewController alloc]init];
            [self.navigationController pushViewController:gcd animated:YES];
            
            break;
        }
        case 2:
        {
            GCDViewController *gcd=[[GCDViewController alloc]init];
            [self.navigationController pushViewController:gcd animated:YES];
            
            break;
        }
        case 3:
        {
            GCDViewController *gcd=[[GCDViewController alloc]init];
            [self.navigationController pushViewController:gcd animated:YES];
            
            break;
        }
            
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
