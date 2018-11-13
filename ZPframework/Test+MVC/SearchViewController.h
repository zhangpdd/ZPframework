//
//  SearchViewController.h
//  gjxs
//
//  Created by 张鹏 on 16/7/20.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

//输入文本
@property (copy, nonatomic) NSString *text;
@end
