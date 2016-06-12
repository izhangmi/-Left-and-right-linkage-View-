//
//  HTMainDepartmentCell.m
//  联动实现
//
//  Created by zhangmi on 16/5/16.
//  Copyright © 2016年 Paramount Pictures. All rights reserved.
//

#import "HTMainDepartmentCell.h"

@implementation HTMainDepartmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
        
    }
    return self;
}

- (void)setupCell {
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 3, 120)];
    lbl.textAlignment = NSTextAlignmentCenter;
    
    lbl.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    lbl.layer.borderWidth = 0.5;
    self.titleLbl = lbl;
    [self addSubview:self.titleLbl];
    
}

@end
