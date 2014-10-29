//
//  ViewController.h
//  TextElement
//
//  Created by cty on 14-9-22.
//  Copyright (c) 2014年 cty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "M_tableData.h"
#import "FMDatabase.h"
#import "User.h"
#import "QiniuSimpleUploader.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
#import "HttpRequest.h"
#import "User_tableDataSoure.h"
#import"AMBlurView.h"
#import "UIImage+ImageEffects.h"
#import <Accelerate/Accelerate.h>
#import "DRNRealTimeBlurView.h"
#import <MessageUI/MessageUI.h>

@class ColorView;
@interface ViewController : UIViewController<UITableViewDelegate,QiniuUploadDelegate,MFMessageComposeViewControllerDelegate>
@property(nonatomic, strong) M_tableData * data;
@property(nonatomic, strong) User_tableDataSoure * userDataSoure;
@property(nonatomic, strong) QiniuSimpleUploader *sUploader;
@property (copy, nonatomic)NSString *filePath;
@property (copy, nonatomic)NSString *token;
@end
