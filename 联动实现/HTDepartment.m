//
//  HTDepartment.m
//  联动实现
//
//  Created by zhangmi on 16/5/16.
//  Copyright © 2016年 Paramount Pictures. All rights reserved.
//

#import "HTDepartment.h"

@implementation HTDepartment

+ (instancetype)departmentWithDict:(NSDictionary *)dict
{
    HTDepartment *department = [[HTDepartment alloc] init];
    [department setValuesForKeysWithDictionary:dict];
    
    return department;
}


@end
