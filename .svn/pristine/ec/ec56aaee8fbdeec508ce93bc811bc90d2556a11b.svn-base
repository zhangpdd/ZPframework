//
//  Config.h
//  ZPframework
//
//  Created by 张鹏 on 16/9/26.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"

//网络状态监控地址
static NSString* const kURL_Reachability__Address=@"www.baidu.com";

//屏幕宽高
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

//应用高宽
#define ScreenFrameWidth [UIScreen mainScreen].applicationFrame.size.width
#define ScreenFrameHeight [UIScreen mainScreen].applicationFrame.size.height

//十六进制颜色赋值
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBColor(r , g , b , a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define ZPWhiteColor     [UIColor whiteColor]
#define ZPLightGrayColor [UIColor lightGrayColor]
#define ZPBlackColor     [UIColor blackColor]
#define ZPClearColor     [UIColor clearColor]
#define ZPGrayColor      [UIColor grayColor]
#define ZPRedColor       [UIColor redColor]
#define ZPYellowColor    [UIColor yellowColor]
#define ZPGreenColor     [UIColor greenColor]
#define ZPBlueColor      [UIColor blueColor]
#define ZPOrangeColor    [UIColor orangeColor]


/*中文字体**/
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]
//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
#define kScreenWidthRatio      (ScreenWidth / 320.0)
#define kScreenHeightRatio     (ScreenHeight / 568.0)
#define AdaptedWidth(x)        ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x)       ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))

