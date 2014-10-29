//
//  M_tableData.h
//  TextElement
//
//  Created by cty on 14-9-23.
//  Copyright (c) 2014年 cty. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^tableViewBlock)(id cell, id title);
@interface M_tableData : NSObject<UITableViewDataSource>
@property(nonatomic, copy)tableViewBlock blck;
-(id)initWithBlock:(tableViewBlock)block;
@end
