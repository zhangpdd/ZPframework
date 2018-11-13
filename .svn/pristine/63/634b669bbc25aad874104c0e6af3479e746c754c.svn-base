//
//  HeadView.m
//  ZPframework
//
//  Created by 张鹏 on 2017/2/14.
//  Copyright © 2017年 zhangPeng. All rights reserved.
//

#import "HeadView.h"
#import "Config.h"
#import "Masonry.h"
//比例
#define ScaleWidth [[UIScreen mainScreen] bounds].size.width/640
#define ScaleHeight [[UIScreen mainScreen] bounds].size.height/1136
@interface HeadView ()
//单位label
@property (strong , nonatomic) UILabel *tagLabel;

@property (strong , nonatomic) UIImageView *bgImage;


@end

@implementation HeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //弱引用
        __weak __typeof(self) weakSelf = self;
        
        //背景色
        self.bgImage=[[UIImageView alloc]init];
        [self addSubview:self.bgImage];
        [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.offset(ScaleHeight*18);
            make.left.offset(ScaleWidth*30);
            make.bottom.offset(-ScaleWidth*12);
            make.width.equalTo(@(ScaleWidth*108));
        }];
        
        
        //标签
        self.tagLabel=[[UILabel alloc]init];
        self.tagLabel.textColor=UIColorFromRGB(0Xffffff);
        self.tagLabel.textAlignment=NSTextAlignmentCenter;
        self.tagLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:11.0];
        [self addSubview:self.tagLabel];
        [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.bottom.right.equalTo(weakSelf.bgImage);
            
        }];
        
    }
    return self;
}

-(void)setLabel:(NSString *)tag BgImageName:(NSString *)name
{
    self.tagLabel.text=tag;
    self.bgImage.image=[UIImage imageWithName:name];
}

@end
