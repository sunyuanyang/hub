//
//  User_tableDataSoure.h
//  TextElement
//
//  Created by cty on 14-9-29.
//  Copyright (c) 2014年 cty. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^USER_CENTERBLOCK)(NSInteger select, NSArray * infor);
@interface User_tableDataSoure : NSObject<UITableViewDataSource>
@property(nonatomic, strong) NSMutableArray * dataArray;
@property(nonatomic, copy) USER_CENTERBLOCK block;
-(id)initWithBlock:(USER_CENTERBLOCK)userCenter;
-(id)init;
-(void)setData:(NSArray *)dataArray;
@end
