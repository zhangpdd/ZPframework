//
//  SearchViewController.m
//  gjxs
//
//  Created by 张鹏 on 16/7/20.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "SearchViewController.h"

#import "Config.h"

@interface SearchViewController ()
//搜索框默认字段
@property(strong,nonatomic)UILabel *searchPlaceholder;


//历史记录
@property (strong,nonatomic) UITableView *historyTableview;
//历史数组
@property (strong, nonatomic) NSMutableArray *historyArr;
//更新数组
@property (strong, nonatomic) NSMutableArray *updateArr;


//搜索输入框
@property (strong, nonatomic) UITextField *searchField;

@end

@implementation SearchViewController

-(UITableView *)historyTableview
{
    if (_historyTableview ==nil) {
        _historyTableview=[[UITableView alloc] initWithFrame:CGRectMake(self.searchField.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
        _historyTableview.delegate=self;
        _historyTableview.dataSource=self;
        
        //取消多余的分割线
        _historyTableview.tableFooterView = [[UIView alloc]init];
    
    }
    return _historyTableview;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBar.backgroundColor=ZPGrayColor;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"sousuo"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(searchList)];
    
    self.searchPlaceholder=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 320, 36)];
    self.searchPlaceholder.text=@"请输入";
    self.searchPlaceholder.textColor=[UIColor lightGrayColor];
    
    
    self.searchField= [[UITextField alloc]initWithFrame:CGRectMake(0,0,320,36)];
    //    self.searchField.placeholder=[NSString stringWithFormat:@"%@",Localized(@"search_placeholder")];
    self.searchField.textColor= [UIColor grayColor];
    self.searchField.font= [UIFont systemFontOfSize:16] ;
    self.searchField.backgroundColor= [UIColor clearColor] ;
    self.searchField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    [self.searchField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged]; // textField的文本发生变化时相应事件
    //设置ReturnKeyType为UIRetuirKeySearch ：
    [self.searchField setReturnKeyType:UIReturnKeySearch];
    //设置UITextField的delegate为self：
    self.searchField.delegate=self;
    
    self.searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.searchField.keyboardType=UIKeyboardTypeDefault;
    [self.searchField addSubview:self.searchPlaceholder];
    self.navigationItem.titleView=self.searchField;
    
    //搜索结果的数组
    self.updateArr=[NSMutableArray arrayWithObjects:@"历史记录", nil];
    //历史数组
    self.historyArr=[NSMutableArray arrayWithObjects:@"历史记录",@"清除历史记录", nil];
    
    [self readNSUserDefaults];
    
    [self addtable];
    
    
    
}

//创建table
-(void)addtable
{
    
    self.historyTableview.hidden = NO;
    
    self.historyTableview.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.historyTableview];
    
    if ([self.historyTableview respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.historyTableview setSeparatorInset: UIEdgeInsetsZero];
    }
    if ([self.historyTableview respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.historyTableview setLayoutMargins: UIEdgeInsetsZero];
    }
}

//分割线居左的代理方法
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
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

//tableview滑动收起键盘
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchField resignFirstResponder];
    
    self.historyTableview.hidden=NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchField.text.length!=0)
    {
        return self.updateArr.count;
    }
    else
    {
        if (self.historyArr.count<3)
        {
            return 0;
        }
        else
            return self.historyArr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    
    
    if (self.searchField.text.length==0)
    {
        if (self.historyArr.count<3)
        {
            self.historyTableview.hidden=YES;
        }
        else
        {
            cell.textLabel.text = self.historyArr[indexPath.row];
            if (indexPath.row==0)
            {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            if (indexPath.row==self.historyArr.count-1 && [cell.textLabel.text isEqualToString:@"清除历史记录"])
            {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.textAlignment=NSTextAlignmentCenter;
            }
            else if (indexPath.row>0 && indexPath.row<self.historyArr.count-1)
            {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.textAlignment=NSTextAlignmentLeft;
                cell.imageView.image=[UIImage imageNamed:@"lishi"];
            }
        }
        
        
    }
    
    
    else
    {
        if (self.updateArr.count<2)
        {
            self.historyTableview.hidden = YES;
        }
        else
        {
            self.historyTableview.hidden = NO;
            cell.textLabel.text = self.updateArr[indexPath.row];
            
            if (indexPath.row==0)
            {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            else
            {
                cell.imageView.image=[UIImage imageNamed:@"lishi"];
            }
        }
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        
    }
    if (indexPath.row==self.historyArr.count-1)
    {
        [self.historyArr removeAllObjects];
        
        self.historyArr=[NSMutableArray arrayWithObjects:@"历史记录",@"清除历史记录", nil];
        //获取userDefault单例
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //注销成功
        [userDefaults setObject:self.historyArr forKey:@"searchHistory"];
        [userDefaults synchronize];
        [self.historyTableview reloadData];
    }
    else if (indexPath.row>0 && indexPath.row<self.historyArr.count-1)
    {
        self.searchField.text = self.historyArr[indexPath.row];
        [self.searchField resignFirstResponder];
        [self searchList];
        self.historyTableview.hidden = YES;
        
        self.searchPlaceholder.hidden=YES;
    }
}

//实时刷新历史纪录匹配数据
-(void)textFileSearch:(NSString *)TextField
{
    if (TextField.length==0)
    {
        
        self.searchPlaceholder.hidden=NO;
        NSLog(@"输入为空");
    }else
    {
        
        self.searchPlaceholder.hidden=YES;
        NSLog(@"输入不为空");
    }
    // 完成具体的搜索功能
    NSLog(@"实时输入数据---%@",TextField);
    //通过循环数据，找出与搜索关键字匹配的内容，把匹配的内容添加到数组中
    
    if (TextField.length!=0)
    {
        //谓词模糊搜索
        NSPredicate *result = [ NSPredicate predicateWithFormat : @"SELF contains[cd] %@" ,TextField];
        //匹配项加入数组
        NSArray *resultArr=[NSArray array];
        resultArr = [self.historyArr filteredArrayUsingPredicate :result];
        
        self.updateArr=[NSMutableArray arrayWithObjects:@"历史记录", nil];
        
        for (int i=0; i<resultArr.count; i++)
        {
            [self.updateArr insertObject:[resultArr objectAtIndex:i] atIndex:1];
        }
    }
    
    
    
}
//当用户全部清空的时候的时候 会调用
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    self.historyTableview.hidden = NO;
    [self.updateArr removeAllObjects];
    
    return YES;
}
//可以得到用户输入的字符
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}
//已经开始编辑的时候 会触发这个方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.text != nil)
    {
        [self textFileSearch:self.text];
    }
}
//结束编辑的时候调用  点击键盘搜索
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    self.text = textField.text;
    
    if ([self.historyArr containsObject:self.text] || self.text.length==0)
    {
        NSLog(@"是否%d",[self.historyArr containsObject:self.text]);
    }
    else
    {
        [self.historyArr insertObject:self.text atIndex:1];
    }
    
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.historyArr forKey:@"searchHistory"];
    
    NSLog(@"%@===",self.historyArr);
    
    [self.historyTableview reloadData];
    
    
    
}

-(void)readNSUserDefaults
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArr=[NSArray array];
    myArr= [userDefaultes arrayForKey:@"searchHistory"];
    self.historyArr = [myArr mutableCopy];
    
    if (self.historyArr.count==0)
    {
        self.historyArr=[NSMutableArray arrayWithObjects:@"历史记录",@"清除历史记录", nil];
    }
    [self.historyTableview reloadData];
}

//点击Return键的时候，（标志着编辑已经结束了）
//响应点击键盘搜索按钮的响应事件的函数
- (BOOL)textFieldShouldReturn:(UITextField*)theTextField
{
    [theTextField resignFirstResponder];
    
    self.historyTableview.hidden=YES;
    [self searchList];
    
    return YES;
}

#pragma mark - UITextFieldDelegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchField resignFirstResponder];
}
//按钮事件
-(void)searchList
{
    [self.searchField resignFirstResponder];
}
//监听textfield的变化
- (void) textFieldDidChange:(UITextField*) TextField
{
    NSLog(@"textField 字符变化了");
    
    [self textFileSearch:TextField.text];
    
    [self.historyTableview reloadData];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
