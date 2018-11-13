//
//  HttpRequest.h
//  ZPframework
//
//  Created by 张鹏 on 2016/10/13.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFNetworking;
@interface HttpRequest : NSObject


+ (HttpRequest *)sharedInstance;

- (void)GET:(NSString *)URLString parameters:(id)parameters progress:(void(^) (float progress))downLoadProgress succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

- (void)POST:(NSString *)URLString parameters:(id)parameters progress:(void(^) (float progress))upLoadProgress succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

@end
