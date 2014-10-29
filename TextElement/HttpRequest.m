//
//  HttpRequest.m
//  Activityup-iOS
//
//  Created by cty on 13-10-30.
//  Copyright (c) 2013年 CitiLife. All rights reserved.
//

#import "HttpRequest.h"
#define kHttpHeaderURIKey @"uri"
#define BASEURL @"http://192.168.40.184:8080/citylife/api/"
#import "JSON/JSON.h"
@implementation HttpRequest
- (id)initWithURI:(NSString *)uri httpMethod:(NSString *)httpMethod
{
    self = [super init];
    if (self) {
        self.httpMethod = [httpMethod uppercaseString];
        self.uri = uri;
    }
    return self;
}
-(void)requestWithWithHttpHeader:(NSDictionary *)header completetion:(DIDREQUSET)completetion
{
    self.already = completetion;
    self.useUrl = BASEURL;
    NSString * url = [NSString stringWithFormat:@"%@%@",self.useUrl,self.uri];
    NSLog(@"url = %@,mothed = %@",url,self.httpMethod);
    NSLog(@"url:%@",url);
    NSURL * requestUrl = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:requestUrl cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    [request addValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Accept"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:APP_KEY forHTTPHeaderField:@"AppKey"];
    
    if (header) {
        [header enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [request addValue:obj forHTTPHeaderField:key];
        }];
    }
    
    if ([self.httpMethod isEqualToString:@"POST"]||[self.httpMethod isEqualToString:@"PUT"]) {
        [request setHTTPMethod:self.httpMethod];
        NSData * bodyData = [self.httpBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];
    }
    NSURLConnection * connction = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    NSLog(@"connection = %@",connction);

    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // store data
     NSHTTPURLResponse * res = (NSHTTPURLResponse *)response;
    self.httpResponse = res;
    self.receivedData = [[NSMutableData alloc] init];          //通常在这里先清空接受数据的缓存
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    /* appends the new data to the received data */
    [self.receivedData appendData:data];

    //可能多次收到数据，把新的数据添加在现有数据最后
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // 错误处理
    NSDictionary * dic = [[NSDictionary alloc] init];
    self.already(_httpResponse,dic,error);
    NSLog(@"error = %@",error);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // disconnect
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    NSError * error;
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:self.receivedData options:NSJSONReadingMutableContainers error:nil];
    self.already(_httpResponse,dic,error);
    
}
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace{
	return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSLog(@"didReceiveAuthenticationChallenge %@ %zd", [[challenge protectionSpace] authenticationMethod], (ssize_t) [challenge previousFailureCount]);
     if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
           [[challenge sender]  useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        
        [[challenge sender]  continueWithoutCredentialForAuthenticationChallenge: challenge];
    }
}

-(void)checkConnect
{
    
}
+(BOOL)isConnectNet
{
    return YES;
}
@end
