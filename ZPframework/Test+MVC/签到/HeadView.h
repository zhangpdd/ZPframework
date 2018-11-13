//
//  HeadView.h
//  ZPframework
//
//  Created by 张鹏 on 2017/2/14.
//  Copyright © 2017年 zhangPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UITableViewHeaderFooterView

//设置背景色及标签
-(void)setLabel: (NSString *)tag BgImageName:(NSString *)name;

@end
