//
//  HttpRequest.h
//  Activityup-iOS
//
//  Created by cty on 13-10-30.
//  Copyright (c) 2013年 CitiLife. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^DIDREQUSET)(NSHTTPURLResponse *response,NSDictionary * data, NSError * connectionError);
@interface HttpRequest : NSObject<NSURLConnectionDelegate>
@property (nonatomic, copy) NSString *uri;
@property (nonatomic, copy) NSString *httpMethod;
@property (nonatomic, copy) NSString *httpBody;
@property(nonatomic,copy) DIDREQUSET already;

@property (nonatomic, copy) NSHTTPURLResponse * httpResponse;
@property(nonatomic,strong) NSMutableData * receivedData;
@property(nonatomic,strong) NSString * message;
@property(nonatomic,strong) NSString * useUrl;
- (id)initWithURI:(NSString *)uri httpMethod:(NSString *)httpMethod;
-(void)requestWithWithHttpHeader:(NSDictionary *)header completetion:(DIDREQUSET)completetion;
+(BOOL)isConnectNet;
@end
