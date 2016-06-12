//
//  ViewController.m
//  联动实现
//
//  Created by zhangmi on 16/5/16.
//  Copyright © 2016年 Paramount Pictures. All rights reserved.
//

#import "ViewController.h"
#import "HTDepartmentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HTDepartmentView *departmentView = [[HTDepartmentView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:departmentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
