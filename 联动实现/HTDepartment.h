//
//  HTDepartment.h
//  联动实现
//
//  Created by zhangmi on 16/5/16.
//  Copyright © 2016年 Paramount Pictures. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTDepartment : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray *detailDepartments;

+ (instancetype)departmentWithDict:(NSDictionary *)dict;


@end
