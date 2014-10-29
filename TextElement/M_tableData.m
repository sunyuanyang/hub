//
//  M_tableData.m
//  TextElement
//
//  Created by cty on 14-9-23.
//  Copyright (c) 2014年 cty. All rights reserved.
//

#import "M_tableData.h"

@implementation M_tableData
-(id)initWithBlock:(tableViewBlock)block
{
    self = [super init];
    if (self) {
        self.blck = block;
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"xxxxx"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xxxxx"];
    }
    self.blck(cell,@"1");
    return cell;
}
@end
