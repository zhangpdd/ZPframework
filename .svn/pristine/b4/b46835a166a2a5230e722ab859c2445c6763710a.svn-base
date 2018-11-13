//
//  DetailsView.m
//  ZPframework
//
//  Created by 张鹏 on 2017/2/13.
//  Copyright © 2017年 zhangPeng. All rights reserved.
//

#import "DetailsView.h"
#import "Config.h"
#import "Masonry.h"

//比例
#define ScaleWidth [[UIScreen mainScreen] bounds].size.width/640
#define ScaleHeight [[UIScreen mainScreen] bounds].size.height/1136

@interface DetailsView()
//数值
@property (strong, nonatomic) UILabel *valueLabel;
//事项名称
@property (strong, nonatomic) UILabel *MatterLabel;

@end

@implementation DetailsView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=UIColorFromRGB(0Xffffff);
        //弱引用
        __weak __typeof(self) weakSelf = self;

        
        self.valueLabel=[[UILabel alloc]init];
        self.valueLabel.textAlignment=NSTextAlignmentCenter;
        self.valueLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:18.0];
        [self addSubview:self.valueLabel];
        [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(ScaleHeight*30);
            make.left.right.offset(0);
            make.height.equalTo(@(ScaleHeight*25));
        }];
        
        
        self.MatterLabel=[[UILabel alloc]init];
        self.MatterLabel.textAlignment=NSTextAlignmentCenter;
        self.MatterLabel.textColor=UIColorFromRGB(0X878787);
        self.MatterLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:12.0];
        [self addSubview:self.MatterLabel];
        [self.MatterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.valueLabel.mas_bottom).offset(ScaleHeight*16);
            make.left.right.offset(0);
            make.height.equalTo(@(ScaleHeight*25));
        }];
        
    }
    
    return self;
}

-(void)setGreenValue:(NSString *)value Matter:(NSString *)matter
{
    self.valueLabel.textColor=UIColorFromRGB(0X25bc57);
    
    self.valueLabel.text=value;
    self.MatterLabel.text=matter;
}

-(void)setRedValue:(NSString *)value Matter:(NSString *)matter
{
    self.valueLabel.textColor=UIColorFromRGB(0Xee2340);
    
    self.valueLabel.text=value;
    self.MatterLabel.text=matter;
}
@end
