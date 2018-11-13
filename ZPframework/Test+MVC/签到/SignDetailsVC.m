//
//  SignDetailsVC.m
//  ZPframework
//
//  Created by 张鹏 on 2017/2/13.
//  Copyright © 2017年 zhangPeng. All rights reserved.
//

#import "SignDetailsVC.h"
#import "Masonry.h"
#import "Config.h"
#import "HttpRequest.h"
#import "DetailsView.h"
#import "DetailsTableViewCell.h"
#import "HeadView.h"
//比例
#define ScaleWidth [[UIScreen mainScreen] bounds].size.width/640
#define ScaleHeight [[UIScreen mainScreen] bounds].size.height/1136

@interface SignDetailsVC ()

//查看详情按钮
@property (strong , nonatomic) UIButton *DetailsBuuton;

//详情table
@property (strong , nonatomic) UITableView *DetailsTable;

@end

@implementation SignDetailsVC

//选择工序按钮懒加载
-(UIButton *)DetailsBuuton
{
    if (_DetailsBuuton == nil) {
        _DetailsBuuton = [[UIButton alloc]init];
        
        [_DetailsBuuton setTitleColor:UIColorFromRGB(0X141414) forState:UIControlStateNormal];
        _DetailsBuuton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12.0];
        _DetailsBuuton.selected = NO;
        _DetailsBuuton.backgroundColor=[UIColor whiteColor];
        [_DetailsBuuton setTitle:@"查看详情" forState:UIControlStateNormal];
        [_DetailsBuuton setImage:[UIImage imageWithName:@"btn_展开"] forState:UIControlStateNormal];
        [_DetailsBuuton addTarget:self action:@selector(details) forControlEvents:UIControlEventTouchUpInside];
        _DetailsBuuton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _DetailsBuuton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _DetailsBuuton.imageEdgeInsets = UIEdgeInsetsMake(0, ScaleWidth*600, 0, ScaleWidth*16);
        
    }
    return _DetailsBuuton;
}

//详细列表懒加载
-(UITableView *)DetailsTable
{
    if (_DetailsTable == nil) {
        _DetailsTable = [[UITableView alloc]init];
        _DetailsTable.delegate=self;
        _DetailsTable.dataSource=self;
        _DetailsTable.separatorStyle = UITableViewCellEditingStyleNone;
        //_DetailsTable.backgroundColor=ZPRedColor;
        [_DetailsTable registerClass:[DetailsTableViewCell class] forCellReuseIdentifier:@"DetailsCell"];
        _DetailsTable.tableFooterView=[[UIView alloc]init];
        _DetailsTable.hidden = YES;
    }
    return _DetailsTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=UIColorFromRGB(0Xf5f8f9);
    
    self.title=@"签到详情";
    
    //背景墙
    UIImageView *topImageBg=[[UIImageView alloc]init];
    [self.view addSubview:topImageBg];
    topImageBg.image=[UIImage imageWithName:@"img"];
     [topImageBg mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.offset(64);
         make.left.right.offset(0);
         make.height.equalTo(@(ScaleHeight*325));
     }];
    
    //办事处背景
    UIImageView *OfficeImageBg=[[UIImageView alloc]init];
    [self.view addSubview:OfficeImageBg];
    OfficeImageBg.image=[UIImage imageWithName:@"bg_办事处人数"];
    [OfficeImageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(ScaleHeight*152+64);
        make.left.offset(ScaleWidth*168);
        make.right.offset(-ScaleWidth*168);
        make.bottom.equalTo(topImageBg.mas_bottom).offset(-ScaleHeight*116);
    }];
    
    //办公室人数
    UILabel *numberLabel=[[UILabel alloc]init];
    [self.view addSubview:numberLabel];
    numberLabel.text=@"江苏办事处 共10人";
    numberLabel.textAlignment=NSTextAlignmentCenter;
    numberLabel.textColor=UIColorFromRGB(0X141414);
    numberLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:12.0];
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(OfficeImageBg);
    }];
    
    
    //详情数据模块
    [self DetailsView];
    
    //查看详情
    [self.view addSubview:self.DetailsBuuton];
    [self.DetailsBuuton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(ScaleHeight*610+64);
        make.left.right.offset(0);
        make.height.equalTo(@(ScaleHeight*80));
    }];
    
    [self.view addSubview:self.DetailsTable];
    [self.DetailsTable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.DetailsBuuton.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.bottom.offset(0);
    }];
}


//详情数据模块
-(void)DetailsView
{
    NSArray *detailsArr=[NSArray array];
    
    detailsArr=@[@"签到",@"出勤率",@"当日办事处排名",@"迟签",@"迟到率",@"当日办事处排名"];
    
    DetailsView  *lastView = nil;
    for (int i=0; i<3; i++)
    {
        DetailsView *details=[[DetailsView alloc]init];
        [self.view addSubview:details];
        [details setGreenValue:[NSString stringWithFormat:@"%d",abs(i-2)] Matter:[detailsArr objectAtIndex:abs(i-2)]];
        
        [details mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(ScaleHeight*345+64);
            make.height.equalTo(@(ScaleHeight*120));
            if (i == 0)
            {
                make.right.offset(0);
                make.width.equalTo(@(ScaleWidth*260));
            }
            else
            {
                make.right.equalTo(lastView.mas_left).offset(-ScaleWidth*2);
                make.width.equalTo(@(ScaleWidth*190));
            }
        }];
        lastView=details;
    }
    
    for (int i=0; i<3; i++)
    {
        DetailsView *details=[[DetailsView alloc]init];
        [self.view addSubview:details];
        [details setRedValue:[NSString stringWithFormat:@"%d",abs(i-2)] Matter:[detailsArr objectAtIndex:abs(i-2)+3]];
        
        [details mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(ScaleHeight*470+64);
            make.height.equalTo(@(ScaleHeight*120));
            if (i == 0)
            {
                make.right.offset(0);
                make.width.equalTo(@(ScaleWidth*260));
            }
            else
            {
                make.right.equalTo(lastView.mas_left).offset(-ScaleWidth*2);
                make.width.equalTo(@(ScaleWidth*190));
            }
        }];
        lastView=details;
    }
}

//详情查看
-(void)details
{
    if (self.DetailsBuuton.selected == NO)
    {
        [self.DetailsBuuton setImage:[UIImage imageWithName:@"btn_收起"] forState:UIControlStateNormal];
        self.DetailsTable.hidden = NO;
        //自动滚动到最后一行
        [self.DetailsTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        self.DetailsBuuton.selected = YES;
    }
    else if (self.DetailsBuuton.selected == YES)
    {
        [self.DetailsBuuton setImage:[UIImage imageWithName:@"btn_展开"] forState:UIControlStateNormal];
        self.DetailsTable.hidden = YES;
        self.DetailsBuuton.selected = NO;
    }

}


//头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ScaleHeight*66;
}

//头视图数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeadView *head=[[HeadView alloc]init];
    head.contentView.backgroundColor=UIColorFromRGB(0Xf5f8f9);
    if (section == 0)
    {
        [head setLabel:@"正常签到" BgImageName:@"bg_正常签到"];
    }
    else if (section == 1)
    {
        [head setLabel:@"迟签人员" BgImageName:@"bg_迟签人员"];
    }
    return head;
}

//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ScaleHeight*124;
}


//cell数量
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    else
        return 2;
    
}


//cell初始化
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DetailsCell"];
    
    
    cell.backgroundColor=UIColorFromRGB(0Xffffff);
    
    [cell setTime:@"2017-02-09  09:07"];
    [cell setInformation:@"金晓冰  崇川路中兴街道广兴路"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
