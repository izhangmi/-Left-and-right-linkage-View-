//
//  HTDepartmentView.m
//  联动实现
//
//  Created by zhangmi on 16/5/16.
//  Copyright © 2016年 Paramount Pictures. All rights reserved.
//

#import "HTDepartmentView.h"
#import "HTMainDepartmentTableView.h"
#import "HTDetailDepartmentTableView.h"
#import "HTMainDepartmentCell.h"
#import "HTDetailDepartmentCell.h"
#import "HTDepartment.h"


@interface HTDepartmentView ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) HTMainDepartmentTableView *departmentTableview;
@property (nonatomic, strong) HTDetailDepartmentTableView *detailDepartmentTableView;

@property (nonatomic, strong) NSMutableArray *departments;

@end

@implementation HTDepartmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        HTMainDepartmentTableView *HTMaindepartment = [[HTMainDepartmentTableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width / 3 - 1, self.bounds.size.height)];
        
        HTDetailDepartmentTableView *detailDepartment = [[HTDetailDepartmentTableView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 3, 0,2 * self.bounds.size.width / 3 + 1, self.bounds.size.height)];
        
        HTMaindepartment.delegate = self;
        HTMaindepartment.dataSource = self;
        
        detailDepartment.delegate = self;
        detailDepartment.dataSource = self;
        
        HTMaindepartment.separatorStyle = UITableViewCellSeparatorStyleNone;
        detailDepartment.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        //中间分割线
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 3 - 1, 0, 2, self.bounds.size.height)];
        blackView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:blackView];
        //测试
        //        departmentTableView.backgroundColor = [UIColor redColor];
        //        detailDepartmentTableView.backgroundColor = [UIColor grayColor];
        
        self.departmentTableview = HTMaindepartment;
        self.detailDepartmentTableView = detailDepartment;
        [self addSubview:HTMaindepartment];
        [self addSubview:detailDepartment];
        
    }
    return self;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.departmentTableview) {
        [self.detailDepartmentTableView reloadData];
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.departmentTableview) {
        return 120;
    } else {
        return 70;
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.departmentTableview) {
        return self.departments.count;
    } else {
        self.departmentTableview.tag = [self.departmentTableview indexPathForSelectedRow].row;
        
        return [self.departments[self.departmentTableview.tag] detailDepartments].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.departmentTableview) {
        HTMainDepartmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"departmentTableViewCell"];
        if (!cell) {
            cell = [[HTMainDepartmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"departmentTableViewCell"];
        }
        cell.titleLbl.text = [self.departments[indexPath.row] name];
        return cell;
    } else {
        HTDetailDepartmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailDepartmentTableViewCell"];
        if (!cell) {
            cell = [[HTDetailDepartmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detailDepartmentTableViewCell"];
        }
        
        cell.textLabel.text = [self.departments[self.departmentTableview.tag] detailDepartments][indexPath.row];
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u88"]];
        cell.accessoryView.transform = CGAffineTransformMakeRotation(- M_PI * 0.5);
        cell.accessoryView.frame = CGRectMake(0, 0, 20, 20);
        return cell;
    }
    
}

#pragma mark - 懒加载
- (NSMutableArray *)departments {
    if (!_departments) {
        _departments = [NSMutableArray array];
        //        NSArray *array = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"department.plist" withExtension:nil]];
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"disease.plist" ofType:nil]];
        [array enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_departments addObject:[HTDepartment departmentWithDict:obj]];
        }];
    }
    return _departments;
}




@end
