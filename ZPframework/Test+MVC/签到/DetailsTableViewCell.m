//
//  DetailsTableViewCell.m
//  ZPframework
//
//  Created by 张鹏 on 2017/2/13.
//  Copyright © 2017年 zhangPeng. All rights reserved.
//

#import "DetailsTableViewCell.h"
#import "Config.h"
#import "Masonry.h"

//比例
#define ScaleWidth [[UIScreen mainScreen] bounds].size.width/640
#define ScaleHeight [[UIScreen mainScreen] bounds].size.height/1136

@interface DetailsTableViewCell ()

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UILabel *informationLabel;

@end

@implementation DetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //弱引用
        __weak __typeof(self) weakSelf = self;
        
        
        //时间
        self.timeLabel=[[UILabel alloc]init];
        self.timeLabel.textColor=UIColorFromRGB(0X878787);
        self.timeLabel.textAlignment=NSTextAlignmentLeft;
        self.timeLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:12.0];
        [self addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.offset(ScaleHeight*32);
            make.left.offset(ScaleWidth*70);
            make.right.offset(0);
            make.height.equalTo(@(ScaleHeight*20));
        }];
        
        //坐标
        UIImageView *coordinate=[[UIImageView alloc]init];
        coordinate.image=[UIImage imageWithName:@"icon_坐标"];
        [self addSubview:coordinate];
        [coordinate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.timeLabel.mas_bottom).offset(ScaleHeight*18);
            make.left.offset(ScaleWidth*30);
            make.right.equalTo(weakSelf.timeLabel.mas_left).offset(-ScaleWidth*20);
            make.height.equalTo(@(ScaleHeight*22));
        }];
        
        
        //签到信息
        self.informationLabel=[[UILabel alloc]init];
        self.informationLabel.textColor=UIColorFromRGB(0X141414);
        self.informationLabel.textAlignment=NSTextAlignmentLeft;
        self.informationLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:12.0];
        [self addSubview:self.informationLabel];
        [self.informationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(weakSelf.timeLabel.mas_bottom).offset(ScaleHeight*22);
            make.left.right.height.equalTo(weakSelf.timeLabel);
        }];
        
    }
    return self;
}


-(void)setTime: (NSString *)timeLabel
{
    self.timeLabel.text=timeLabel;
}

-(void)setInformation: (NSString *)informationLabel
{
    self.informationLabel.text=informationLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
