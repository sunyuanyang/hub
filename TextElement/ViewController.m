//
//  ViewController.m
//  TextElement
//
//  Created by cty on 14-9-22.
//  Copyright (c) 2014年 cty. All rights reserved.
//

#import "ViewController.h"
#import "NaviGation.h"
#import "JSON.h"
#import "GTMBase64.h"
#import "ColorView.h"
#define NSLog(format, ...) do {\
fprintf(stderr, "<%s : %d> %s\n",\
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
__LINE__, __func__);\
(NSLog)((format), ##__VA_ARGS__); \
fprintf(stderr, "-------\n");\
} while (0)
@interface ViewController ()

@end

@implementation ViewController
-(IBAction)showSMSPicker:(id)sender {
    
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    
    if (messageClass != nil) {
        
        if ([messageClass canSendText]) {
            
            [self displaySMSComposerSheet];
            
        }
        
        else {
            
            //设备没有短信功能
            
        }
        
    }
    
    else {
        
        // iOS版本过低,iOS4.0以上才支持程序内发送短信
        
    }
    
}
-(void)displaySMSComposerSheet

{
    
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    picker.messageComposeDelegate = self;
    NSString * SMSCode=@"123456";
    picker.body=SMSCode;
    [self presentModalViewController:picker animated:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showSMSPicker:self];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
    label.text = @"hehehhehehehehehhehjhsdhjsdhfljsdfsdhfjklsdfljkhfjkshfjsfjfhfjfhsdjfhdsajkfhdsjkfhsdjkfhsdjlkfhjksdfhdsdsfsdfsdfdsfsdfdsfdsfdsfdsfdsfdsfsjh";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    UIView * bacl = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
    bacl.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.3];
    [self.view addSubview:bacl];

    

    
//    [self insertWithSQL:@"INSERT INTO USER (id,name,sex,tel,role,passwoed,state,fans,foucis,message,headerimage,bindsina,bindwx,bindqq,bindrenren) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",@"1111",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    
    
    
    
    
    
//    [self gecd];
//    NSLog(@"wwwwwwwwwwwwwww");
//    ColorView * clor = [[ColorView alloc] initWithFrame:CGRectMake(0, 0, 320, 600)];
//    [self.view addSubview:clor];
    NaviGation * nac = [[NaviGation alloc] initWithFrame:CGRectMake(0, 0, 320, 64) title:nil leftButtonType:ImageType lDescription:@"return@2x.png" completionLeft:^{
        
    } rightButtonType:ImageType RDescription:nil completionRight:^{
        
    }];
//    if ([kinUrl isEqualToString:@"hello"]) {
//        NSLog(@"test = %@",kinUrl);
//    }
    
    [self.view addSubview:nac];
    
//    UIImageView * images = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 280, 100)];
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"1111.png" ofType:nil];
//
//    UIImage * im = [UIImage imageWithContentsOfFile:path];
//    images.image = [im applyExtraLightEffect];
//    [self.view addSubview:images];
//
    [self boli];

    
    
}
-(void)boli
{
    
    UIImageView *speakerImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 100, 100)];
    speakerImage.image = [UIImage imageNamed:@"speaker"];
    
    //Creates a live blur view
    DRNRealTimeBlurView * blurView = [[DRNRealTimeBlurView alloc] initWithFrame:CGRectMake(60, 0, 200, 200)];
    [self.view addSubview:blurView];
    
    //..and adds a subview
    [blurView addSubview:speakerImage];
}
-(void)gecd
{
    NSMutableArray * tests = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4", nil];
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    for (int i = 0; i < tests.count ; i++) {
//        NSString * ss = [tests objectAtIndex:i];
//        dispatch_group_async(group, queue, ^{
//            [self logtest:ss];
//        });
//    }
//    dispatch_group_notify(group, queue, ^{
//        [self removeLast:tests];
//
//    });
    
    dispatch_apply(tests.count, queue, ^(size_t indext) {
        [self logtest:[tests objectAtIndex:indext]];
    });
    [self removeLast:tests];
    NSLog(@"*********************%@********************",tests);

}
-(void)removeLast:(NSMutableArray *)array
{
    [array removeLastObject];
}
-(void)logtest:(NSString *)tes
{
    NSLog(@"test = %@",tes);
}
-(void)printS
{
    NSLog(@"first");
}
-(void)getPIc
{
//    HttpRequest * request = [[HttpRequest alloc] initWithURI:@"http://legendtech-video.qiniudn.com/daohanglan%402x.png" httpMethod:@"GET"];
//    [request requestWithWithHttpHeader:nil completetion:^(NSHTTPURLResponse *response, NSDictionary *data, NSError *connectionError) {
//        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
//        
//    }];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://legendtech-video.qiniudn.com/daohanglan%402x.png"]] queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        image.image = [UIImage imageWithData:data];
        [self.view addSubview:image];
    }];
    
//    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://legendtech-video.qiniudn.com/11.jpg"]];
////    [[NSData alloc] initWithContentsOfFile:[NSURL URLWithString:@"http://legendtech-video.qiniudn.com/11.jpg"]];
//    NSLog(@"data = %@",data);
//    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
//    image.image = [UIImage imageWithData:data];
//    [self.view addSubview:image];
    
}

-(void)uoload
{
    NSMutableDictionary * returnBody = [[NSMutableDictionary alloc] init];
    [returnBody setObject:@"weixin.png" forKey:@"name"];
    [returnBody setObject:[NSNumber numberWithInteger:214513] forKey:@"size"];
    [returnBody setObject:[NSNumber numberWithInt:640] forKey:@"h"];
    [returnBody setObject:[NSNumber numberWithInt:480] forKey:@"w"];
    [returnBody setObject:@"Fh8xVqod2MQ1mocfI4S4KpRL6D98" forKey:@"hash"];
    HttpRequest * request = [[HttpRequest alloc] initWithURI:[NSString stringWithFormat:@"v1/qiniu/%@/%@",@"weixin",@"png"] httpMethod:@"POST"];
    NSString * httpBody = [returnBody JSONRepresentation];
    [request setHttpBody:httpBody];
    [request requestWithWithHttpHeader:nil completetion:^(NSHTTPURLResponse *response, NSDictionary *data, NSError *connectionError) {
        int code = [[data objectForKey:@"code"] intValue];
        if (code == 1) {
            NSString * token = [data objectForKey:@"str"];
            [self upLoadFile:@"weixin.png" withToken:token];
        }
        NSLog(@"hello");
        
        NSLog(@"hello");
    }];
}
-(void)upLoadFile:(NSString * )fileNanme withToken:(NSString * )token
{
    QiniuSimpleUploader * simper = [QiniuSimpleUploader uploaderWithToken:token];
    simper.delegate = self;
    _filePath = [[NSBundle mainBundle] pathForResource:@"weixin.png" ofType:nil];
    [simper uploadFile:_filePath key:@"weixin.png" extra:nil];

}
- (void)uploadProgressUpdated:(NSString *)theFilePath percent:(float)percent
{
    NSString *progressStr = [NSString stringWithFormat:@"Progress Updated: - %f\n", percent];
    
}

- (void)uploadSucceeded:(NSString *)theFilePath ret:(NSDictionary *)ret
{
    NSString *succeedMsg = [NSString stringWithFormat:@"Upload Succeeded: - Ret: %@\n", ret];
    
}

// Upload failed
- (void)uploadFailed:(NSString *)theFilePath error:(NSError *)error
{
    NSString *failMsg = [NSString stringWithFormat:@"Upload Failed: %@  - Reason: %@", theFilePath, error];
}
-(void)chargeMyIphone:(void(^)(void))finishBlock
{
    
    double delayinSecond = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayinSecond * NSEC_PER_SEC));
                                            
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        NSLog(@"电充好了");
        finishBlock();
    });

}
- (IBAction)upload:(id)sender {
    self.token = @"";
}























- (NSString *)makeToken:(NSString *)accessKey secretKey:(NSString *)secretKey
{
    const char *secretKeyStr = [secretKey UTF8String];
    
    NSString *policy;
    //= [self marshal];
    
    NSData *policyData = [policy dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *encodedPolicy = [GTMBase64 stringByWebSafeEncodingData:policyData padded:TRUE];
    const char *encodedPolicyStr = [encodedPolicy cStringUsingEncoding:NSUTF8StringEncoding];
    
    char digestStr[CC_SHA1_DIGEST_LENGTH];
    bzero(digestStr, 0);
    
    CCHmac(kCCHmacAlgSHA1, secretKeyStr, strlen(secretKeyStr), encodedPolicyStr, strlen(encodedPolicyStr), digestStr);
    
    NSString *encodedDigest = [GTMBase64 stringByWebSafeEncodingBytes:digestStr length:CC_SHA1_DIGEST_LENGTH padded:TRUE];
    
    NSString *token = [NSString stringWithFormat:@"%@:%@:%@",  accessKey, encodedDigest, encodedPolicy];
    
    return token;
}

//- (NSString *)marshal
//{
//    time_t deadline;
//    time(&deadline);
//    
//    deadline +=  3600; // 1 hour by default.
//    NSNumber *deadlineNumber = [NSNumber numberWithLongLong:deadline];
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    
//    if (self.scope) {
//        [dic setObject:self.scope forKey:@"scope"];
//    }
//    if (self.callbackUrl) {
//        [dic setObject:self.callbackUrl forKey:@"callbackUrl"];
//    }
//    if (self.callbackBodyType) {
//        [dic setObject:self.callbackBodyType forKey:@"callbackBodyType"];
//    }
//    if (self.customer) {
//        [dic setObject:self.customer forKey:@"customer"];
//    }
//    
//    [dic setObject:deadlineNumber forKey:@"deadline"];
//    
//    if (self.escape) {
//        NSNumber *escapeNumber = [NSNumber numberWithLongLong:escape];
//        [dic setObject:escapeNumber forKey:@"escape"];
//    }
//    
//    NSString *json = [dic JSONString];
//    
//    return json;
//}




















-(void)setHash
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"testcity:daohanglan@2x.png" forKey:@"scope"];
    [dic setObject:[NSNumber numberWithInteger:1451491200] forKey:@"deadline"];
    NSMutableDictionary * contentDic = [[NSMutableDictionary alloc] init];
    [contentDic setObject:@"daohanglan@2x.png" forKey:@"name"];
    [contentDic setObject:[NSNumber numberWithInteger:214513] forKey:@"size"];
    [contentDic setObject:[NSNumber numberWithInt:640] forKey:@"h"];
    [contentDic setObject:[NSNumber numberWithInt:480] forKey:@"w"];
    [contentDic setObject:@"Fh8xVqod2MQ1mocfI4S4KpRL6D98" forKey:@"hash"];
    [dic setObject:contentDic forKey:@"returnBody"];
    NSString * httpBody = [dic JSONRepresentation];
    
    NSString * base64 = [GTMBase64 encodeBase64String:httpBody];
    NSString * appKey = @"iQzUxGJMTf0P5KecxfVmVhCmL9mkmUbMNbFVjiCH";
    const char * cKey = [appKey cStringUsingEncoding:NSUTF8StringEncoding];
    const char * cData = [base64 cStringUsingEncoding:NSUTF8StringEncoding];
    char cHMAC[CC_SHA1_DIGEST_LENGTH];//接受编码结果
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);//开始编码
    NSData * HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];//编码转化为data
    NSString * hash = [GTMBase64 encodeBase64Data:HMAC];//base64编码
    NSString *  result = [NSString stringWithFormat:@"%@:%@:%@",@"U3XR-9YN-41Vwh2O3ywhmWctU5Ki33WVy-3LRq_H",hash,base64];

    NSLog(@"hash = %@",result);

}


























- (NSString *)getMd5_32Bit_String:(NSString *)srcString{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}
-(void)setFMDB
{
    NSString * path = PathForDocuments(nil);
    FMDatabase * db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
       BOOL result = [db executeUpdate:@"INSERT INTO USER (id,name,sex,tel,role,passwoed,state,fans,foucis,message,headerimage,bindsina,bindwx,bindqq,bindrenren) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",@"1111",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    }
}
-(BOOL)deleteUSER
{
    BOOL result = NO;
    NSString * path = PathForDocuments(nil);
    FMDatabase * db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        result = [db executeUpdate:@"DELETE FROM USER"];
    }
    return result;
}
-(BOOL)insertWithSQL:(NSString *)sql,...
{
    BOOL result = NO;
    NSString * path = PathForDocuments(nil);
    FMDatabase * db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        result = [db executeUpdate:@"INSERT INTO USER (id,name,sex,tel,role,passwoed,state,fans,foucis,message,headerimage,bindsina,bindwx,bindqq,bindrenren) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",@"1111",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    }
    [db close];
    return result;
}
-(BOOL)deleteTable:(NSString *)tableName withIDName:(NSString *)IDname ID:(NSString *)ID
{
    BOOL result = NO;
    NSString * sql;
    NSString * path = PathForDocuments(nil);
    FMDatabase * db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        if (ID.length > 0) {
            sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = %@",tableName,IDname,ID];
            result = [db executeUpdate:sql];
        }else{
            sql = [NSString stringWithFormat:@"DELETE FROM %@",tableName];
            result = [db executeUpdate:sql];

        }
        
    }
    return result;
}
//tableview轻量化
-(void)setTable
{
    UITableView * table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:table];
    table.delegate = self;
//    self.userDataSoure = [[User_tableDataSoure alloc] init];
//    tableViewBlock block = ^(UITableViewCell * cell, NSString * title){
//        cell.textLabel.text = title;
//    };
//
//    self.data = [[M_tableData alloc] initWithBlock:block];
    self.userDataSoure = [[User_tableDataSoure alloc] init];
    table.dataSource = self.userDataSoure;
    NSArray * array = [[NSArray alloc] initWithObjects:@"1",@"2", nil];
    [self.userDataSoure setData:array];
    [table reloadData];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//获取路径
NSString *PathForDocuments(NSString *fileName)
{
    fileName = @"citylife.sqlite";
    NSFileManager *file_manager = [NSFileManager defaultManager];
    NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * dbPath = [documentPath stringByAppendingPathComponent:fileName];
    if (![file_manager fileExistsAtPath:dbPath]) {
        NSString * path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        [file_manager copyItemAtPath:path toPath:dbPath error:nil];
    }
    return dbPath;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
