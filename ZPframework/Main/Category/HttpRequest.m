//
//  HttpRequest.m
//  ZPframework
//
//  Created by 张鹏 on 2016/10/13.
//  Copyright © 2016年 zhangPeng. All rights reserved.
//

#import "HttpRequest.h"
#import "AFNetworking.h"
/*get请求最多10秒，post最多30秒*/
#define getTimeOut 10.0f
#define postTimeOut 30.0f

@implementation HttpRequest

/**
 *  创建网络请求类的单例
 */
static HttpRequest *httpRequest = nil;
+ (HttpRequest *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [[self alloc] init];
        }
    });
    return httpRequest;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [super allocWithZone:zone];
        }
    });
    return httpRequest;
}
- (instancetype)copyWithZone:(NSZone *)zone
{
    return httpRequest;
}
/**
 *  封装AFN的GET请求
 *
 *  @param URLString 网络请求地址
 *  @param parameters      参数(可以是字典或者nil)
 *  @param succeed   成功后执行success block
 *  @param failure   失败后执行failure block
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters progress:(void(^) (float progress))downLoadProgress succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure
{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //请求时间
    manager.requestSerializer.timeoutInterval = getTimeOut;
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    //发送网络请求(请求方式为GET)
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"downLoadProcess = %@",downLoadProgress);
        if (downloadProgress) {
            
            downLoadProgress(downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请求失败，请检查网络是否连接" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alt show];
    }];
}
/**
 *  封装AFN的POST请求
 *
 *  @param URLString 网络请求地址
 *  @param parameters      参数(可以是字典或者nil)
 *  @param succeed   成功后执行success block
 *  @param failure   失败后执行failure block
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters progress:(void(^) (float progress))upLoadProgress succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure
{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //请求时间
    manager.requestSerializer.timeoutInterval = postTimeOut;
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    //发送网络请求(请求方式为POST)
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"downLoadProcess = %@",upLoadProgress);
        if (uploadProgress) {
            
            upLoadProgress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请求失败，请检查网络是否连接" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alt show];

    }];
}
@end
