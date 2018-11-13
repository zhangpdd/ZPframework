//
//  NoNetWorkView.m
//  gjxs
//
//  Created by 周鹏 on 16/8/9.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "NoNetWorkView.h"
#import "Config.h"

@interface NoNetWorkView ()

@property(nonatomic,strong)UIImageView *imageview;
@property(nonatomic,strong)UILabel *labelTitle;

@end
@implementation NoNetWorkView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf5f5f5);
        
        self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/4, 64+100, ScreenWidth/2, 100)];
        
    
        [self addSubview:self.imageview];
        
        self.labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, self.imageview.y + self.imageview.height + 20, ScreenWidth, 50)];
        self.labelTitle.numberOfLines = 0;
        self.labelTitle.textAlignment = NSTextAlignmentCenter;
        self.labelTitle.text = @"123";
        self.labelTitle.textColor = [UIColor blackColor];
        self.labelTitle.font = [UIFont systemFontOfSize:14.5f];
        [self addSubview:self.labelTitle];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, self.labelTitle.y + self.labelTitle.height, ScreenWidth, 40)];
        label1.numberOfLines = 0;
        label1.textAlignment = NSTextAlignmentCenter;
        label1.text = @"固定的text";
        label1.textColor = UIColorFromRGB(0x92969c);
        label1.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:label1];
    }
    return self;
}

-(void)setimage:(NSString *)imageUrl title:(NSString *)remindTitle
{
    self.imageview.image=[UIImage imageNamed:imageUrl];
    
    self.labelTitle.text=remindTitle;
}
@end
