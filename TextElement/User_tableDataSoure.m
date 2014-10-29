//
//  User_tableDataSoure.m
//  TextElement
//
//  Created by cty on 14-9-29.
//  Copyright (c) 2014年 cty. All rights reserved.
//

#import "User_tableDataSoure.h"

@implementation User_tableDataSoure
-(id)initWithBlock:(USER_CENTERBLOCK)userCenter
{
    self = [super init];
    if (self) {
        self.block = userCenter;
        self.dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}
-(id)init
{
    self = [super init];
    if (self) {
        self.dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void)setData:(NSArray *)dataArray
{
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:dataArray];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"xxxxx"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xxxxx"];
    }
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}
@end
