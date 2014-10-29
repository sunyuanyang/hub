//
//  User.h
//  Unity-iPhone
//
//  Created by cty on 14-9-22.
//
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic, strong) NSString * telephone;
@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) NSString * password;
@property(nonatomic, assign) int * role;
@property(nonatomic, assign) int * state;
@end
