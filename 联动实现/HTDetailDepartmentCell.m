//
//  HTDetailDepartmentCell.m
//  联动实现
//
//  Created by zhangmi on 16/5/16.
//  Copyright © 2016年 Paramount Pictures. All rights reserved.
//

#import "HTDetailDepartmentCell.h"

@implementation HTDetailDepartmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, 70, 2 * [UIScreen mainScreen].bounds.size.width / 3, 1)];
        separator.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:separator];
        UIView *separator2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2 * [UIScreen mainScreen].bounds.size.width / 3, 1)];
        separator2.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:separator2];
        
    }
    return self;
}

@end
